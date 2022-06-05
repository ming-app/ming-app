library authentication_repository;

import 'package:authentication_repository/src/authentication_repository.dart';
import 'package:authentication_repository/src/models/models.dart';
import 'package:cache/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

export 'src/authentication_repository.dart';
export 'src/models/models.dart';

abstract class AuthenticationRepository {
  factory AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  }) {
    return AuthenticationRepositoryImpl(
        cache: cache, firebaseAuth: firebaseAuth, googleSignIn: googleSignIn);
  }

  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [AuthInfo] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [AuthInfo.empty] if the user is not authenticated.
  Stream<AuthInfo> get user;

  /// Returns the current cached user.
  /// Defaults to [AuthInfo.empty] if there is no cached user.
  AuthInfo get currentUser;

  /// get id token for the user, if token is expired, then refresh it.
  /// Throws a [AuthenticateException] if user is not logged in before.
  Future<String> get idToken;

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [AuthenticateException] if an exception occurs.
  Future<void> signUp({required String email, required String password});

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [AuthenticateException] if an exception occurs.
  Future<void> logInWithGoogle();

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [AuthenticateException] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user which will emit
  /// [AuthInfo.empty] from the [user] Stream.
  ///
  /// Throws a [AuthenticateException] if an exception occurs.
  Future<void> logOut();

  /// Delete current user if user exists
  Future<void> delete();
}

/// Unified exception for auth.
class AuthenticateException implements Exception {
  /// creator
  AuthenticateException({this.message, this.code, this.nestedError});

  /// from firebase excetion
  AuthenticateException.fromFirebaseException(
    firebase_auth.FirebaseAuthException e,
  )   : message = e.message,
        code = e.code,
        nestedError = e;

  /// general message for exception
  final String? message;

  /// if code is required, then it will be stored in here.
  final String? code;

  /// if original exception is required, then it will be stored in here.
  final Object? nestedError;
}
