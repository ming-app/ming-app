// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalInShelterOverview _$AnimalInShelterOverviewFromJson(
        Map<String, dynamic> json) =>
    AnimalInShelterOverview(
      json['count'] as int,
      $enumDecode(_$AnimalTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AnimalInShelterOverviewToJson(
        AnimalInShelterOverview instance) =>
    <String, dynamic>{
      'count': instance.count,
      'type': _$AnimalTypeEnumMap[instance.type]!,
    };

const _$AnimalTypeEnumMap = {
  AnimalType.cat: 'CAT',
  AnimalType.dog: 'DOG',
};

ShelterByRegionResponse _$ShelterByRegionResponseFromJson(
        Map<String, dynamic> json) =>
    ShelterByRegionResponse(
      json['adoptedAnimalCount'] as int,
      json['animalInShelterCount'] as int,
      json['count'] as int,
      RegionResponse.fromJson(json['region'] as Map<String, dynamic>),
      UserListOverviewResponse.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShelterByRegionResponseToJson(
        ShelterByRegionResponse instance) =>
    <String, dynamic>{
      'adoptedAnimalCount': instance.adoptedAnimalCount,
      'animalInShelterCount': instance.animalInShelterCount,
      'count': instance.count,
      'region': instance.region,
      'volunteerOverview': instance.volunteerOverview,
    };

ShelterImagesResponse _$ShelterImagesResponseFromJson(
        Map<String, dynamic> json) =>
    ShelterImagesResponse(
      json['id'] as String,
      json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$ShelterImagesResponseToJson(
        ShelterImagesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailUrl': instance.thumbnailUrl,
    };

ShelterInfoResponse _$ShelterInfoResponseFromJson(Map<String, dynamic> json) =>
    ShelterInfoResponse(
      json['id'] as String,
      json['name'] as String,
      json['introduction'] as String,
      json['location'] as String,
      json['phoneNumber'] as String,
      json['adminName'] as String,
      json['snsUrl'] as String?,
      ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      UserListOverviewResponse.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
      (json['animalOverview'] as List<dynamic>)
          .map((e) =>
              AnimalInShelterOverview.fromJson(e as Map<String, dynamic>))
          .toList(),
      RegionResponse.fromJson(json['region'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShelterInfoResponseToJson(
        ShelterInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'adminName': instance.adminName,
      'image': instance.image,
      'snsUrl': instance.snsUrl,
      'volunteerOverview': instance.volunteerOverview,
      'animalOverview': instance.animalOverview,
      'region': instance.region,
    };
