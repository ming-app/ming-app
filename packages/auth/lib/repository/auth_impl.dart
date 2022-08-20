import 'dart:async';
import 'dart:convert';

import 'package:auth/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hive/hive.dart';
import 'package:log/log.dart';
import 'package:ming_api/ming_api.dart';
import 'package:universal_html/html.dart';

class MingAuthImpl implements MingAuth {
  static const String _accessTokenKey = "ACCESS_TOKEN";
  static const String _refreshTokenKey = "REFRESH_TOKEN";
  static const String _accessTokenExpireKey =
      "ACCESS_TOKEN_EXPIRE_SECOND_EPOCH";
  static const String _refreshTokenExpireKey =
      "REFRESH_TOKEN_EXPIRE_SECOND_EPOCH";
  static const int safeTimeForTokenInSec = 20 * 60;

  final String secureKey;
  final MingApiRepository api;
  final HiveInterface hive;

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
      final response = await api.client.getAccessTokenFromKakaoCode(code);
      final authToken = response.result!;

      // store token to hive
      await _storeToken(authToken);
      _statusController.sink.add(AuthStatus(true, authToken.accessToken));

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

    String accessToken = box.get(_accessTokenKey);
    int expireTime = box.get(_accessTokenExpireKey);

    int timeDiff = expireTime - _currentTimeInSec;

    if (timeDiff < safeTimeForTokenInSec) {
      // todo: try to refresh token
      logout();
      throw AuthException("Access token expired");
    }

    return accessToken;
  }

  @override
  bool get isLogIn => _isLogIn;

  @override
  Stream<AuthStatus> get status => _statusController.stream;

  final StreamController<AuthStatus> _statusController =
      StreamController<AuthStatus>.broadcast();

  var _isLogIn = false;

  int get _currentTimeInSec =>
      (DateTime.now().millisecondsSinceEpoch / 60) as int;

  Future<Box<String>> get _box async {
    if (Hive.isBoxOpen("AuthStore")) return Hive.box("AuthStore");
    return Hive.openBox(
      "AuthStore",
      encryptionCipher: HiveAesCipher(base64Url.decode(secureKey)),
    );
  }

  Future<void> _storeToken(AuthToken token) async {
    Box box = await _box;

    await box.put(_accessTokenKey, token.accessToken);
    await box.put(_refreshTokenKey, token.refreshToken);
    await box.put(_accessTokenExpireKey, token.expiresIn + _currentTimeInSec);
    await box.put(_refreshTokenExpireKey,
        token.refreshTokenExpiresIn + _currentTimeInSec);
  }

  Future<void> _deleteToken() async {
    Box box = await _box;

    await box.deleteAll([
      _accessTokenKey,
      _refreshTokenKey,
    ]);
  }
}