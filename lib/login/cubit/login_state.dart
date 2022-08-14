part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginStart extends LoginState {}

class LoginSucess extends LoginState {}

class LoginFailed extends LoginState {
  final String message;

  LoginFailed(this.message);
}
