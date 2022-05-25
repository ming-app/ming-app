// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      json['id'] as int,
      json['shelterId'] as int,
      json['name'] as String,
      json['introduction'] as String,
      json['birthYear'] as String,
      json['imageUrl'] as String,
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
