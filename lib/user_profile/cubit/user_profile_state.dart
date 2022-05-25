part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileState {
  User get user;
  String? get message;
}

class UserProfileInitial extends UserProfileState {
  @override
  User get user => User.empty();

  @override
  final String message = "잠시만 기다려주세요.";
}

class UserProfileFetched extends UserProfileState {
  @override
  final User user;

  @override
  final String? message;

  UserProfileFetched(this.user, {this.message});
}

class UserProfileError extends UserProfileState {
  @override
  User get user => User.empty();

  @override
  final String message;

  UserProfileError(this.message);
}
