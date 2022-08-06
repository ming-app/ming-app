// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalOverviewResponse _$AnimalOverviewResponseFromJson(
        Map<String, dynamic> json) =>
    AnimalOverviewResponse(
      json['id'] as String,
      json['name'] as String,
      $enumDecode(_$AnimalGenderEnumMap, json['gender']),
      json['age'] as int,
      json['thumbnailUrl'] as String,
      json['description'] as String,
      UserListOverviewResponse.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalOverviewResponseToJson(
        AnimalOverviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': _$AnimalGenderEnumMap[instance.gender]!,
      'age': instance.age,
      'thumbnailUrl': instance.thumbnailUrl,
      'description': instance.description,
      'volunteerOverview': instance.volunteerOverview,
    };

const _$AnimalGenderEnumMap = {
  AnimalGender.female: 'FEMALE',
  AnimalGender.male: 'MALE',
};

AnimalDetailResponse _$AnimalDetailResponseFromJson(
        Map<String, dynamic> json) =>
    AnimalDetailResponse(
      json['id'] as String,
      json['name'] as String,
      $enumDecode(_$AnimalTypeEnumMap, json['type']),
      json['kind'] as String,
      json['foundLocation'] as String,
      json['birthDay'] as String,
      json['relatedAgency'] as String,
      json['takeOverDate'] as String,
      json['inShelterDays'] as int,
      json['neutering'] as bool,
      json['weightKg'] as int,
      ShelterOverviewResponse.fromJson(json['shelter'] as Map<String, dynamic>),
      UserListOverviewResponse.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnimalDetailResponseToJson(
        AnimalDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$AnimalTypeEnumMap[instance.type]!,
      'kind': instance.kind,
      'foundLocation': instance.foundLocation,
      'birthDay': instance.birthDay,
      'relatedAgency': instance.relatedAgency,
      'takeOverDate': instance.takeOverDate,
      'inShelterDays': instance.inShelterDays,
      'neutering': instance.neutering,
      'weightKg': instance.weightKg,
      'shelter': instance.shelter,
      'volunteerOverview': instance.volunteerOverview,
    };

const _$AnimalTypeEnumMap = {
  AnimalType.cat: 'CAT',
  AnimalType.dog: 'DOG',
};
