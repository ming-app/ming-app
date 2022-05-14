import 'package:flutter_test/flutter_test.dart';
import 'package:ming/models/auth_repository.dart';

void main() {
  group('Test Auth Repository', () {
    test('Test email validator', () async {
      var validEmail = "test@positive.com";
      assert(AuthRepository.isValidEmail(validEmail));

      var invalidEmail = "test";
      assert(!AuthRepository.isValidEmail(invalidEmail));
      invalidEmail = "test.create";
      assert(!AuthRepository.isValidEmail(invalidEmail));
      invalidEmail = "test@fwef";
      assert(!AuthRepository.isValidEmail(invalidEmail));
    });

    test('test password safe checker', () async {
      var validPassword = "Test!1324";
      assert(AuthRepository.isPasswordSafe(validPassword));
      validPassword = "test!1234";
      assert(AuthRepository.isPasswordSafe(validPassword));

      var invalidPassword = "Test1234";
      assert(!AuthRepository.isPasswordSafe(invalidPassword));
      invalidPassword = "Test@1";
      assert(!AuthRepository.isPasswordSafe(invalidPassword));
      invalidPassword = "abwefoijdk";
      assert(!AuthRepository.isPasswordSafe(invalidPassword));
    });
  });

  group('Test Auth implementation with Firebase', () {});
}
