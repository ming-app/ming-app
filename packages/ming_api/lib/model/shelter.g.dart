// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ShelterCWProxy {
  Shelter id(int id);

  Shelter introduction(String? introduction);

  Shelter name(String name);

  Shelter numberOfCats(int? numberOfCats);

  Shelter numberOfDogs(int? numberOfDogs);

  Shelter numberOfVolunteers(int? numberOfVolunteers);

  Shelter phoneNumber(String? phoneNumber);

  Shelter snsUrl(String? snsUrl);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shelter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shelter(...).copyWith(id: 12, name: "My name")
  /// ````
  Shelter call({
    int? id,
    String? introduction,
    String? name,
    int? numberOfCats,
    int? numberOfDogs,
    int? numberOfVolunteers,
    String? phoneNumber,
    String? snsUrl,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfShelter.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfShelter.copyWith.fieldName(...)`
class _$ShelterCWProxyImpl implements _$ShelterCWProxy {
  final Shelter _value;

  const _$ShelterCWProxyImpl(this._value);

  @override
  Shelter id(int id) => this(id: id);

  @override
  Shelter introduction(String? introduction) =>
      this(introduction: introduction);

  @override
  Shelter name(String name) => this(name: name);

  @override
  Shelter numberOfCats(int? numberOfCats) => this(numberOfCats: numberOfCats);

  @override
  Shelter numberOfDogs(int? numberOfDogs) => this(numberOfDogs: numberOfDogs);

  @override
  Shelter numberOfVolunteers(int? numberOfVolunteers) =>
      this(numberOfVolunteers: numberOfVolunteers);

  @override
  Shelter phoneNumber(String? phoneNumber) => this(phoneNumber: phoneNumber);

  @override
  Shelter snsUrl(String? snsUrl) => this(snsUrl: snsUrl);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Shelter(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Shelter(...).copyWith(id: 12, name: "My name")
  /// ````
  Shelter call({
    Object? id = const $CopyWithPlaceholder(),
    Object? introduction = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? numberOfCats = const $CopyWithPlaceholder(),
    Object? numberOfDogs = const $CopyWithPlaceholder(),
    Object? numberOfVolunteers = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? snsUrl = const $CopyWithPlaceholder(),
  }) {
    return Shelter(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      introduction: introduction == const $CopyWithPlaceholder()
          ? _value.introduction
          // ignore: cast_nullable_to_non_nullable
          : introduction as String?,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      numberOfCats: numberOfCats == const $CopyWithPlaceholder()
          ? _value.numberOfCats
          // ignore: cast_nullable_to_non_nullable
          : numberOfCats as int?,
      numberOfDogs: numberOfDogs == const $CopyWithPlaceholder()
          ? _value.numberOfDogs
          // ignore: cast_nullable_to_non_nullable
          : numberOfDogs as int?,
      numberOfVolunteers: numberOfVolunteers == const $CopyWithPlaceholder()
          ? _value.numberOfVolunteers
          // ignore: cast_nullable_to_non_nullable
          : numberOfVolunteers as int?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
      snsUrl: snsUrl == const $CopyWithPlaceholder()
          ? _value.snsUrl
          // ignore: cast_nullable_to_non_nullable
          : snsUrl as String?,
    );
  }
}

extension $ShelterCopyWith on Shelter {
  /// Returns a callable class that can be used as follows: `instanceOfShelter.copyWith(...)` or like so:`instanceOfShelter.copyWith.fieldName(...)`.
  _$ShelterCWProxy get copyWith => _$ShelterCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shelter _$ShelterFromJson(Map<String, dynamic> json) => Shelter(
      id: json['id'] as int,
      name: json['name'] as String,
      introduction: json['introduction'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
      numberOfDogs: json['numberOfDogs'] as int?,
      numberOfCats: json['numberOfCats'] as int?,
      numberOfVolunteers: json['numberOfVolunteers'] as int?,
    );

Map<String, dynamic> _$ShelterToJson(Shelter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
      'numberOfDogs': instance.numberOfDogs,
      'numberOfCats': instance.numberOfCats,
      'numberOfVolunteers': instance.numberOfVolunteers,
    };

ShelterRegisterRequest _$ShelterRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    ShelterRegisterRequest(
      json['name'] as String,
    );

Map<String, dynamic> _$ShelterRegisterRequestToJson(
        ShelterRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ShelterUpdateRequest _$ShelterUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    ShelterUpdateRequest(
      json['shelterId'] as int,
      introduction: json['introduction'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$ShelterUpdateRequestToJson(
        ShelterUpdateRequest instance) =>
    <String, dynamic>{
      'shelterId': instance.shelterId,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

ShelterResponse _$ShelterResponseFromJson(Map<String, dynamic> json) =>
    ShelterResponse(
      id: json['id'] as int,
      introduction: json['introduction'] as String?,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$ShelterResponseToJson(ShelterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

RegisterUserToShelterRequest _$RegisterUserToShelterRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterUserToShelterRequest(
      json['shelterId'] as int,
      json['userEmail'] as String,
    );

Map<String, dynamic> _$RegisterUserToShelterRequestToJson(
        RegisterUserToShelterRequest instance) =>
    <String, dynamic>{
      'shelterId': instance.shelterId,
      'userEmail': instance.userEmail,
    };
