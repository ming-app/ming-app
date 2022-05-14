// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ming/adapters/auth_firebase_impl.dart';
import 'package:ming/models/auth_repository.dart';
import 'package:random_string/random_string.dart';

import 'test_common.dart';

// launch flutter emulator before testing
// firebase emulators:start --import="./integration_test/resources/emulator_dump"
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Test Auth Implementation with firebase: ", () {
    late AuthRepository repo;
    const presetEmail = "test@testhost.com";
    const presetPassword = "thisis@password1234";

    setUpAll(() async {
      await setupFirebase();
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    });

    setUp(() async {
      repo = AuthFirebaseImpl(FirebaseAuth.instance);
    });

    test("Test is unque email or not", () async {
      var uniqueEmail = "test1@testhost.com";
      expect(await repo.isUniqueEmail(uniqueEmail), true);
      expect(await repo.isUniqueEmail(presetEmail), false);
    });

    test("Test Sign in successfully with email and pwd", () async {
      var cred = await repo.signInUsingEmail(presetEmail, presetPassword);
      expect(cred.user!.email, presetEmail);
    });

    test("Test Sign in failing with email and pwd by user not found.",
        () async {
      var email = "test1@testhost.com";
      var wait = repo.signInUsingEmail(email, presetPassword);
      expect(
          () async => await wait,
          throwsA(predicate((e) =>
              e is FirebaseAuthException && e.code == "user-not-found")));
    });

    test("Test Sign in failing with email and pwd by password wrong.",
        () async {
      var password = "thisis@password12";
      var wait = repo.signInUsingEmail(presetEmail, password);
      expect(
          () async => await wait,
          throwsA(predicate((e) =>
              e is FirebaseAuthException && e.code == "wrong-password")));
    });

    test("Test account creation/deletion", () async {
      var email =
          "${randomString(10, from: lowerAlphaStart, to: lowerAlphaEnd)}@testhost.com"
              .toLowerCase();
      print("Test account is $email");

      await repo.createAccount(email, presetPassword, presetPassword);

      var cred = await repo.signInUsingEmail(email, presetPassword);
      expect(cred.user!.email, email);

      // attempt to recreate with same email.
      print("Attempt for recreate with same email");
      var wait = repo.createAccount(email, presetPassword, presetPassword);
      expect(() async => await wait, throwsA(predicate((e) {
        print(e);
        return e is FirebaseAuthException;
      })));

      // deletion
      await repo.deleteUser(repo.currentUser!);
      expect(repo.currentUser, null);

      wait = repo.signInUsingEmail(email, presetPassword);
      expect(() async => await wait, throwsA(predicate((e) {
        print(e);
        return e is FirebaseAuthException && e.code == "user-not-found";
      })));
    });
  });
}
