part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class StartListenAuthStatus extends AuthEvent {}

class LogOut extends AuthEvent {}
