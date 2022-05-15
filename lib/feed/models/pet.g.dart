// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pet _$PetFromJson(Map<String, dynamic> json) => Pet(
      json['id'] as String,
      json['name'] as String,
      json['birth'] as String,
      (json['image_urls'] as List<dynamic>).map((e) => e as String).toList(),
      json['desc'] as String,
    );

Map<String, dynamic> _$PetToJson(Pet instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birth': instance.birth,
      'image_urls': instance.imageUrls,
      'desc': instance.desc,
    };
