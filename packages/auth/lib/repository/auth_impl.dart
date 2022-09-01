import 'dart:async';
import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hive/hive.dart';
import 'package:log/log.dart';
import 'package:ming_api/ming_api.dart';
import 'package:universal_html/html.dart';

part 'auth_impl.g.dart';

int get _currentTimeInSec => DateTime.now().millisecondsSinceEpoch ~/ 60;

class MingAuthImpl implements MingAuth {
  static const String _accessTokenKey = "ACCESS_TOKEN";
  static const int safeTimeForTokenInSec = 20 * 60;

  final String secureKey;
  final MingApiRepository api;
  final HiveInterface hive;

  bool _initialized = false;

  MingAuthImpl(
    this.api,
    this.hive,
    this.secureKey,
  );

  @override
  Future<String> loginUsingKakao(
    String key,
  ) async {
    if (!kIsWeb) {
      throw UnimplementedError("Mobile App login is not implemented yet.");
    }

    final redirectTarget = "http://${window.location.host}/auth.html";
    final url = Uri.https(
      'kauth.kakao.com',
      'oauth/authorize',
      {
        'response_type': 'code',
        'client_id': key,
        'redirect_uri': redirectTarget,
      },
    );

    try {
      final result = await FlutterWebAuth.authenticate(
        url: "$url",
        callbackUrlScheme: "auth",
      );

      final code = Uri.parse(result).queryParameters['code']!;
      final response =
          await api.client.getAccessTokenFromKakaoCode(code, redirectTarget);
      final authToken = response.result!;

      // store token to hive
      await _storeToken(authToken);
      _statusController.sink.add(AuthStatus(true, authToken.accessToken));

      _isLogIn = true;

      return authToken.accessToken;
    } catch (e) {
      await logout();
      Log.e("Error on handling kakao login", e);
    }

    throw AuthException("Login using Kakao error");
  }

  @override
  Future<void> logout() async {
    await _deleteToken();
    _statusController.sink.add(AuthStatus(false, ""));
    _isLogIn = false;
  }

  @override
  Future<String> get token async {
    Box box = await _box;

    if (!box.containsKey(_accessTokenKey)) {
      logout();
      throw AuthException("Currently Not logged in");
    }

    AuthHiveObject accessToken = box.get(_accessTokenKey);
    int expireTime = accessToken.expiresIn;

    int timeDiff = expireTime - _currentTimeInSec;

    if (timeDiff < safeTimeForTokenInSec) {
      // todo: try to refresh token
      try {
        String refreshToken = accessToken.refreshToken;

        final token = await api.client.refreshToken(
          refreshToken,
          "KAKAO_TALK",
        );

        _storeToken(token);
        return token.accessToken;
      } catch (e) {
        Log.e("Error on getting refreshed accessToken", e);

        logout();
        throw AuthException("Access token expired");
      }
    }

    return accessToken.accessToken;
  }

  @override
  bool get isLogIn => _isLogIn;

  @override
  Stream<AuthStatus> get status => _statusController.stream;

  final StreamController<AuthStatus> _statusController =
      StreamController<AuthStatus>.broadcast();

  var _isLogIn = false;

  Future<Box<AuthHiveObject>> get _box async {
    if (!_initialized) {
      Hive.init(null);
      Hive.registerAdapter(AuthHiveObjectAdapter());
      _initialized = true;
    }

    if (Hive.isBoxOpen("AuthStore")) {
      return Hive.box<AuthHiveObject>("AuthStore");
    }
    return Hive.openBox<AuthHiveObject>(
      "AuthStore",
      encryptionCipher: HiveAesCipher(base64Url.decode(secureKey)),
    );
  }

  Future<void> _storeToken(AuthToken token) async {
    Box box = await _box;

    await box.put(_accessTokenKey, AuthHiveObject.fromAuth(token));
  }

  Future<void> _deleteToken() async {
    Box box = await _box;

    await box.deleteAll([
      _accessTokenKey,
    ]);
  }
}

@HiveType(typeId: 1)
class AuthHiveObject {
  @HiveField(0)
  String accessToken;
  @HiveField(1)
  String refreshToken;
  @HiveField(2)
  String tokenType;
  @HiveField(3)
  int expiresIn;
  @HiveField(4)
  int refreshTokenExpiresIn;

  AuthHiveObject({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.refreshTokenExpiresIn,
    required this.tokenType,
  });

  factory AuthHiveObject.fromAuth(AuthToken token) {
    return AuthHiveObject(
      accessToken: token.accessToken,
      refreshToken: token.refreshToken,
      expiresIn: token.expiresIn + _currentTimeInSec,
      refreshTokenExpiresIn: token.refreshTokenExpiresIn + _currentTimeInSec,
      tokenType: token.tokenType,
    );
  }
}
