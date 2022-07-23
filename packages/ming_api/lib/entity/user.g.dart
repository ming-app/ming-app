// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserCWProxy {
  User email(String email);

  User introduction(String? introduction);

  User name(String? name);

  User snsUrl(String? snsUrl);

  User uid(String uid);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    String? email,
    String? introduction,
    String? name,
    String? snsUrl,
    String? uid,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUser.copyWith.fieldName(...)`
class _$UserCWProxyImpl implements _$UserCWProxy {
  final User _value;

  const _$UserCWProxyImpl(this._value);

  @override
  User email(String email) => this(email: email);

  @override
  User introduction(String? introduction) => this(introduction: introduction);

  @override
  User name(String? name) => this(name: name);

  @override
  User snsUrl(String? snsUrl) => this(snsUrl: snsUrl);

  @override
  User uid(String uid) => this(uid: uid);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `User(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// User(...).copyWith(id: 12, name: "My name")
  /// ````
  User call({
    Object? email = const $CopyWithPlaceholder(),
    Object? introduction = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? snsUrl = const $CopyWithPlaceholder(),
    Object? uid = const $CopyWithPlaceholder(),
  }) {
    return User(
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      introduction: introduction == const $CopyWithPlaceholder()
          ? _value.introduction
          // ignore: cast_nullable_to_non_nullable
          : introduction as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      snsUrl: snsUrl == const $CopyWithPlaceholder()
          ? _value.snsUrl
          // ignore: cast_nullable_to_non_nullable
          : snsUrl as String?,
      uid: uid == const $CopyWithPlaceholder() || uid == null
          ? _value.uid
          // ignore: cast_nullable_to_non_nullable
          : uid as String,
    );
  }
}

extension $UserCopyWith on User {
  /// Returns a callable class that can be used as follows: `instanceOfUser.copyWith(...)` or like so:`instanceOfUser.copyWith.fieldName(...)`.
  _$UserCWProxy get copyWith => _$UserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      introduction: json['introduction'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'introduction': instance.introduction,
      'snsUrl': instance.snsUrl,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      introduction: json['introduction'] as String?,
      name: json['name'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      introduction: json['introduction'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String,
      snsUrl: json['snsUrl'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
      'email': instance.email,
      'uid': instance.uid,
    };
