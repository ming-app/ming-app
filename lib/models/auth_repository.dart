import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

// todo: Firebase의 User와 UserCredential 등의 data entity를 따로 다시 abstract해야하나?
abstract class AuthRepository {
  // 0. Auth status
  User? get currentUser; // null if not signed in
  bool get isSignedIn;

  // 1. User creation
  static bool isValidEmail(String email) {
    return EmailValidator.validate(email);
  }

  // check https://www.section.io/engineering-education/password-strength-checker-javascript/
  // 8글자 이상, 영문 포함, 숫자 포함, 특수문자 포함
  static bool isPasswordSafe(String password) {
    return RegExp("(?=.*[a-z])(?=.*[0-9])(?=.*[^A-Za-z0-9])(?=.{8,})")
        .hasMatch(password);
  }

  static bool isPasswordSetsAreSame(String password, String confirm) =>
      password == confirm;

  Future<bool> isUniqueEmail(String email);

  // should throw AuthServerException for fail case.
  Future<UserCredential> createAccount(
      String email, String password, String confirm);

  // 2. User signIn
  // should throw AuthServerException for fail case.
  Future<UserCredential> signInUsingEmail(String email, String password);

  Future<void> signout();

  // for special purpose (update password, delete account, etc.)
  Future<void> reAuthenticateUsingEmail(String email, String password);

  // 3. User deletion, need to re-auth before deletion
  Future<void> deleteUser(User user);

  // 4. Update password, need to re-auth before deletion
  Future<void> updatePassword(User user);
}

class AuthServerException implements Exception {
  static const invalidEmail = "invalid-email";
  static const userDisabled = "user-disabled";
  static const userNotFound = "user-not-found";
  static const wrongPassword = "wrong-password";
  static const weakPassword = "weak-password";

  final String code;
  final String message;
  final String misc;

  AuthServerException({
    required this.code,
    this.message = "",
    this.misc = "",
  });
}
