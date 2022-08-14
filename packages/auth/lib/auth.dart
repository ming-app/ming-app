library auth;

import 'package:auth/repository/auth_impl.dart';
import 'package:hive/hive.dart';
import 'package:ming_api/ming_api.dart';

abstract class MingAuth {
  Stream<AuthStatus> get status;

  bool get isLogIn;
  Future<String> get token;

  Future<String> loginUsingKakao(String key);
  // todo: implement other login methods.
  Future<void> logout();

  factory MingAuth(
    MingApiRepository api,
    String secureKey, {
    HiveInterface? hive,
  }) {
    return MingAuthImpl(
      api,
      hive ?? Hive,
      secureKey,
    );
  }
}

class AuthStatus {
  final bool isLogIn;
  final String token;

  AuthStatus(
    this.isLogIn,
    this.token,
  );
}

class AuthException implements Exception {
  String? message;

  AuthException([this.message]);

  @override
  String toString() {
    return "AuthException: $message";
  }
}
