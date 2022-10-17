// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserProfileCWProxy {
  UserProfile address(String? address);

  UserProfile birthday(String? birthday);

  UserProfile email(String email);

  UserProfile gender(UserGender? gender);

  UserProfile introduction(String? introduction);

  UserProfile name(String name);

  UserProfile phoneNumber(String? phoneNumber);

  UserProfile snsUrl(String? snsUrl);

  UserProfile thumbnailUrl(String thumbnailUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    String? address,
    String? birthday,
    String? email,
    UserGender? gender,
    String? introduction,
    String? name,
    String? phoneNumber,
    String? snsUrl,
    String? thumbnailUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserProfile.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserProfile.copyWith.fieldName(...)`
class _$UserProfileCWProxyImpl implements _$UserProfileCWProxy {
  final UserProfile _value;

  const _$UserProfileCWProxyImpl(this._value);

  @override
  UserProfile address(String? address) => this(address: address);

  @override
  UserProfile birthday(String? birthday) => this(birthday: birthday);

  @override
  UserProfile email(String email) => this(email: email);

  @override
  UserProfile gender(UserGender? gender) => this(gender: gender);

  @override
  UserProfile introduction(String? introduction) =>
      this(introduction: introduction);

  @override
  UserProfile name(String name) => this(name: name);

  @override
  UserProfile phoneNumber(String? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  UserProfile snsUrl(String? snsUrl) => this(snsUrl: snsUrl);

  @override
  UserProfile thumbnailUrl(String thumbnailUrl) =>
      this(thumbnailUrl: thumbnailUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserProfile(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserProfile(...).copyWith(id: 12, name: "My name")
  /// ````
  UserProfile call({
    Object? address = const $CopyWithPlaceholder(),
    Object? birthday = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? gender = const $CopyWithPlaceholder(),
    Object? introduction = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? snsUrl = const $CopyWithPlaceholder(),
    Object? thumbnailUrl = const $CopyWithPlaceholder(),
  }) {
    return UserProfile(
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      birthday: birthday == const $CopyWithPlaceholder()
          ? _value.birthday
          // ignore: cast_nullable_to_non_nullable
          : birthday as String?,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String,
      gender: gender == const $CopyWithPlaceholder()
          ? _value.gender
          // ignore: cast_nullable_to_non_nullable
          : gender as UserGender?,
      introduction: introduction == const $CopyWithPlaceholder()
          ? _value.introduction
          // ignore: cast_nullable_to_non_nullable
          : introduction as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      snsUrl: snsUrl == const $CopyWithPlaceholder()
          ? _value.snsUrl
          // ignore: cast_nullable_to_non_nullable
          : snsUrl as String?,
      imageUrl:
          thumbnailUrl == const $CopyWithPlaceholder() || thumbnailUrl == null
              ? _value.imageUrl
              // ignore: cast_nullable_to_non_nullable
              : thumbnailUrl as String,
    );
  }
}

extension $UserProfileCopyWith on UserProfile {
  /// Returns a callable class that can be used as follows: `instanceOfUserProfile.copyWith(...)` or like so:`instanceOfUserProfile.copyWith.fieldName(...)`.
  _$UserProfileCWProxy get copyWith => _$UserProfileCWProxyImpl(this);
}
