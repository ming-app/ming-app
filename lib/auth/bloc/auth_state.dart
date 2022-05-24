part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final AuthInfo info;

  Authenticated(this.info) {
    Log.d("Authenticated");
  }
}

class UnAuthenticated extends AuthState {}
