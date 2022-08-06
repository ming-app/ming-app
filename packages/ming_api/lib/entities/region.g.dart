// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionResponse _$RegionResponseFromJson(Map<String, dynamic> json) =>
    RegionResponse(
      json['id'] as String,
      json['fullName'] as String,
      json['name'] as String,
      underRegion: (json['underRegion'] as List<dynamic>?)
          ?.map((e) => RegionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RegionResponseToJson(RegionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'name': instance.name,
      'underRegion': instance.underRegion,
    };
