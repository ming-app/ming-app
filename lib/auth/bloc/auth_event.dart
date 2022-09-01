part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class StartListenAuthStatus extends AuthEvent {}

class AuthenticateEvent extends AuthEvent {
  final UserInfo userInfo;

  AuthenticateEvent(this.userInfo);
}

class LogOut extends AuthEvent {}

class AuthLost extends AuthEvent {}
