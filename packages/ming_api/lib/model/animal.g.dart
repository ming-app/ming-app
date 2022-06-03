// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnimalCWProxy {
  Animal birthYear(String birthYear);

  Animal id(int id);

  Animal imageUrl(String imageUrl);

  Animal introduction(String introduction);

  Animal name(String name);

  Animal shelterId(int shelterId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Animal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Animal(...).copyWith(id: 12, name: "My name")
  /// ````
  Animal call({
    String? birthYear,
    int? id,
    String? imageUrl,
    String? introduction,
    String? name,
    int? shelterId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnimal.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnimal.copyWith.fieldName(...)`
class _$AnimalCWProxyImpl implements _$AnimalCWProxy {
  final Animal _value;

  const _$AnimalCWProxyImpl(this._value);

  @override
  Animal birthYear(String birthYear) => this(birthYear: birthYear);

  @override
  Animal id(int id) => this(id: id);

  @override
  Animal imageUrl(String imageUrl) => this(imageUrl: imageUrl);

  @override
  Animal introduction(String introduction) => this(introduction: introduction);

  @override
  Animal name(String name) => this(name: name);

  @override
  Animal shelterId(int shelterId) => this(shelterId: shelterId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Animal(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Animal(...).copyWith(id: 12, name: "My name")
  /// ````
  Animal call({
    Object? birthYear = const $CopyWithPlaceholder(),
    Object? id = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? introduction = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? shelterId = const $CopyWithPlaceholder(),
  }) {
    return Animal(
      birthYear: birthYear == const $CopyWithPlaceholder() || birthYear == null
          ? _value.birthYear
          // ignore: cast_nullable_to_non_nullable
          : birthYear as String,
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as int,
      imageUrl: imageUrl == const $CopyWithPlaceholder() || imageUrl == null
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as String,
      introduction:
          introduction == const $CopyWithPlaceholder() || introduction == null
              ? _value.introduction
              // ignore: cast_nullable_to_non_nullable
              : introduction as String,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      shelterId: shelterId == const $CopyWithPlaceholder() || shelterId == null
          ? _value.shelterId
          // ignore: cast_nullable_to_non_nullable
          : shelterId as int,
    );
  }
}

extension $AnimalCopyWith on Animal {
  /// Returns a callable class that can be used as follows: `instanceOfAnimal.copyWith(...)` or like so:`instanceOfAnimal.copyWith.fieldName(...)`.
  _$AnimalCWProxy get copyWith => _$AnimalCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      id: json['id'] as int,
      shelterId: json['shelterId'] as int,
      name: json['name'] as String,
      introduction: json['introduction'] as String,
      birthYear: json['birthYear'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'id': instance.id,
      'shelterId': instance.shelterId,
      'name': instance.name,
      'introduction': instance.introduction,
      'birthYear': instance.birthYear,
      'imageUrl': instance.imageUrl,
    };

AnimalRegisterRequest _$AnimalRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    AnimalRegisterRequest(
      AnimalInfo.fromJson(json['animalInfo'] as Map<String, dynamic>),
      json['shelterId'] as int,
    );

Map<String, dynamic> _$AnimalRegisterRequestToJson(
        AnimalRegisterRequest instance) =>
    <String, dynamic>{
      'animalInfo': instance.animalInfo,
      'shelterId': instance.shelterId,
    };

AnimalInfo _$AnimalInfoFromJson(Map<String, dynamic> json) => AnimalInfo(
      json['name'] as String,
      json['introduction'] as String,
      json['birthYear'] as String,
      json['imageUrl'] as String,
    );

Map<String, dynamic> _$AnimalInfoToJson(AnimalInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'introduction': instance.introduction,
      'birthYear': instance.birthYear,
      'imageUrl': instance.imageUrl,
    };

AnimalResponse _$AnimalResponseFromJson(Map<String, dynamic> json) =>
    AnimalResponse(
      json['id'] as int,
      json['name'] as String,
      json['introduction'] as String,
      json['birthYear'] as String,
      json['imageUrl'] as String,
      json['shelterId'] as int,
    );

Map<String, dynamic> _$AnimalResponseToJson(AnimalResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'birthYear': instance.birthYear,
      'imageUrl': instance.imageUrl,
      'shelterId': instance.shelterId,
    };
