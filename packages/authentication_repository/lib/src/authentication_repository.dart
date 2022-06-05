import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cache/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  @visibleForTesting
  bool isWeb = kIsWeb;

  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  @override
  Stream<AuthInfo> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user =
          firebaseUser == null ? AuthInfo.empty : firebaseUser.toAuthInfo;
      _cache.write(key: userCacheKey, value: user);
      return user;
    });
  }

  @override
  AuthInfo get currentUser {
    return _cache.read<AuthInfo>(key: userCacheKey) ?? AuthInfo.empty;
  }

  @override
  Future<String> get idToken async {
    // we need to wait fir userChanges to ensure login status at refresh.
    await _firebaseAuth.userChanges().first;
    if (_firebaseAuth.currentUser == null) {
      throw AuthenticateException(message: 'Currently, user is not logged in.');
    }

    return _firebaseAuth.currentUser!.getIdToken();
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthenticateException.fromFirebaseException(e);
    } catch (e) {
      Log.e('Signup failure.', e);
      throw AuthenticateException(
        message: 'Unknown signup failure.',
        nestedError: e,
      );
    }

    Log.i('Successfully signed up.');
  }

  @override
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AuthenticateException.fromFirebaseException(e);
    } catch (e) {
      Log.e('Google Login failure.', e);
      throw AuthenticateException(
        message: 'Unknown Login failure.',
        nestedError: e,
      );
    }
  }

  @override
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthenticateException.fromFirebaseException(e);
    } catch (e) {
      Log.e('Email Login failure.', e);
      throw AuthenticateException(
        message: 'Unknown Login failure.',
        nestedError: e,
      );
    }

    Log.i('Successfully Logged in.');
  }

  @override
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        // _googleSignIn.signOut(), // todo: support google signin too.
      ]);
    } on FirebaseAuthException catch (e) {
      throw AuthenticateException.fromFirebaseException(e);
    } catch (e) {
      Log.e('Logout failure.', e);
      throw AuthenticateException(
        message: 'Unknown Logout failure.',
        nestedError: e,
      );
    }

    Log.i('Successfully Logged out.');
  }

  @override
  Future<void> delete() async {
    try {
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw AuthenticateException.fromFirebaseException(e);
    } catch (e) {
      Log.e('Account delete failure.', e);
      throw AuthenticateException(
        message: 'Unknown delete failure.',
        nestedError: e,
      );
    }
  }
}

extension on firebase_auth.User {
  AuthInfo get toAuthInfo {
    return AuthInfo(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
