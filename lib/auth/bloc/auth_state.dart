part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final UserInfo info;

  Authenticated(this.info) {
    Log.d("Authenticated");
  }
}

class Authenticating extends AuthState {}

class UnAuthenticated extends AuthState {}
