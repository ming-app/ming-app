part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileState {
  UserProfile get user;
  String? get message;

  // for refreshing text form field.
  String? get key;
}

class UserProfileInitial extends UserProfileState {
  @override
  UserProfile get user => UserProfile.empty();

  @override
  final String message = "잠시만 기다려주세요.";

  @override
  final String? key = null;
}

class UserProfileNotLoggedIn extends UserProfileState {
  @override
  UserProfile get user => UserProfile.empty();

  @override
  final String message = "Login이 필요합니다.";

  @override
  final String? key = null;
}

class UserProfileUpdating extends UserProfileState {
  @override
  UserProfile get user => UserProfile.empty();

  @override
  final String message = "잠시만 기다려주세요.";

  @override
  final String? key = null;
}

class UserProfileFetched extends UserProfileState {
  @override
  final UserProfile user;

  @override
  final String? message;

  @override
  final String? key = const Uuid().v4();

  UserProfileFetched(this.user, {this.message});
}

enum UserProfileEditingType {
  address,
  snsUrl,
  image,
  introduction,
  birthday,
  gender,
  none,
}

class UserProfileEditing extends UserProfileState {
  @override
  final UserProfile user;

  @override
  final String? message;

  @override
  final String? key = null;

  final UserProfileEditingType type;

  UserProfileEditing(this.type, this.user, {this.message});
}

class UserProfileError extends UserProfileState {
  @override
  UserProfile get user => UserProfile.empty();

  @override
  final String message;

  @override
  final String? key = null;

  UserProfileError(this.message);
}
