import 'package:firebase_auth/firebase_auth.dart';

// todo: Firebase의 User와 UserCredential 등의 data entity를 따로 다시 abstract해야하나?
abstract class AuthRepository {
  // 0. Auth status
  abstract User? currentUser; // null if not signed in
  abstract bool isSignedIn;

  // 1. User creation
  bool isValidEmail(String email);
  Future<bool> isUniqueEmail(String email);

  bool isPasswordSafe(String password);
  bool isPasswordSetsAreSame(String password, String confirm);
  // should throw AuthServerException for fail case.
  Future<void> createAccount(String email, String password, String confirm);

  // 2. User signIn
  // should throw AuthServerException for fail case.
  Future<UserCredential> signInUsingEmail(String email, String password);
  // for special purpose (update password, delete account, etc.)
  Future<void> reAuthenticateUsingEmail(String email, String password);

  // 3. User deletion, need to re-auth before deletion
  Future<void> deleteUser(User user);

  // 4. Update password
  Future<void> updatePassword(User user, String password, String confirm);
}

class AuthServerException implements Exception {
  final String reason;
  AuthServerException(this.reason);
}
