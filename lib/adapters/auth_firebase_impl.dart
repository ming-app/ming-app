import 'package:firebase_auth/firebase_auth.dart';
import 'package:ming/models/auth_repository.dart';

// todo: handle exceptions (firebase, logging, etc.)
class AuthFirebaseImpl extends AuthRepository {
  final FirebaseAuth _auth;

  AuthFirebaseImpl(this._auth);

  @override
  User? get currentUser => _auth.currentUser;

  @override
  late bool isSignedIn;

  @override
  Future<UserCredential> createAccount(
      String email, String password, String confirm) async {
    // check valid email.
    if (!AuthRepository.isValidEmail(email)) {
      throw AuthServerException(code: AuthServerException.invalidEmail);
    }

    // check password confirm.
    if (!AuthRepository.isPasswordSetsAreSame(password, confirm)) {
      throw AuthServerException(code: AuthServerException.wrongPassword);
    }

    if (!AuthRepository.isPasswordSafe(password)) {
      throw AuthServerException(code: AuthServerException.weakPassword);
    }

    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> deleteUser(User user) async {
    await user.delete();
  }

  @override
  Future<bool> isUniqueEmail(String email) async {
    // if fetchSignInMethods is empty, then the email is unqiue.
    return (await _auth.fetchSignInMethodsForEmail(email)).isEmpty;
  }

  @override
  Future<void> reAuthenticateUsingEmail(String email, String password) async {}

  @override
  Future<UserCredential> signInUsingEmail(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signout() async {
    await _auth.signOut();
  }

  @override
  Future<void> updatePassword(User user) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}
