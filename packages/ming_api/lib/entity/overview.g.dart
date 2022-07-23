// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewResponse _$OverviewResponseFromJson(Map<String, dynamic> json) =>
    OverviewResponse(
      json['count'] as int,
      Region.fromJson(json['region'] as Map<String, dynamic>),
      VolunteerOverview.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
      AnimalOverview.fromJson(json['animal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OverviewResponseToJson(OverviewResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'region': instance.region,
      'volunteerOverview': instance.volunteerOverview,
      'animal': instance.animal,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      json['id'] as String,
      json['name'] as String,
      json['fullName'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
    };

VolunteerOverview _$VolunteerOverviewFromJson(Map<String, dynamic> json) =>
    VolunteerOverview(
      json['count'] as int,
      (json['thumbnailUrl'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$VolunteerOverviewToJson(VolunteerOverview instance) =>
    <String, dynamic>{
      'count': instance.count,
      'thumbnailUrl': instance.thumbnailUrl,
    };

AnimalOverview _$AnimalOverviewFromJson(Map<String, dynamic> json) =>
    AnimalOverview(
      json['adoptedCount'] as int,
      json['inShelterCount'] as int,
    );

Map<String, dynamic> _$AnimalOverviewToJson(AnimalOverview instance) =>
    <String, dynamic>{
      'adoptedCount': instance.adoptedCount,
      'inShelterCount': instance.inShelterCount,
    };
