// ignore_for_file: avoid_print

import 'package:authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:random_string/random_string.dart';

import 'test_common.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
  group("Auth repository test", () {
    late AuthenticationRepository repository;

    const presetEmail = "test@testhost.com";
    const presetPassword = "thisis@password1234";

    setUpAll(() async {
      await setupFirebase();
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    });

    setUp(() async {
      repository =
          AuthenticationRepository(firebaseAuth: FirebaseAuth.instance);
    });

    test("Test log in / log out", () async {
      await repository.logInWithEmailAndPassword(
          email: presetEmail, password: presetPassword);

      var user = await repository.user.first;
      expect(user.email, presetEmail);

      await repository.logOut();
      var result = await repository.user.first;
      expect(result.isEmpty, true);
    });

    test("Test log in failing with email and pwd by user not found.", () async {
      var email = "test1@testhost.com";
      var wait = repository.logInWithEmailAndPassword(
          email: email, password: presetPassword);
      expect(() async => await wait,
          throwsA(predicate((e) => e is LogInWithEmailAndPasswordFailure)));
    });

    test("Test log in failing with email and pwd by password wrong.", () async {
      var password = "thisis@password12";
      var wait = repository.logInWithEmailAndPassword(
          email: presetEmail, password: password);
      expect(() async => await wait,
          throwsA(predicate((e) => e is LogInWithEmailAndPasswordFailure)));
    });

    test("Test account creation", () async {
      var email =
          "${randomString(10, from: lowerAlphaStart, to: lowerAlphaEnd)}@testhost.com"
              .toLowerCase();
      print("Test account is $email");

      await repository.signUp(email: email, password: presetPassword);
      await repository.logInWithEmailAndPassword(
          email: email, password: presetPassword);

      var user = await repository.user.first;
      expect(user.email, email);

      // attempt to recreate with same email.
      print("Attempt for recreate with same email");
      var wait = repository.signUp(email: email, password: presetPassword);
      expect(() async => await wait, throwsA(predicate((e) {
        print(e);
        return e is SignUpWithEmailAndPasswordFailure;
      })));
    });
  });
}
