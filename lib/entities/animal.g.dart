// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Animal _$AnimalFromJson(Map<String, dynamic> json) => Animal(
      json['id'] as String,
      json['shelter_id'] as String,
      json['name'] as String,
      json['image_url'] as String,
      json['desc'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'id': instance.id,
      'shelter_id': instance.shelterId,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'desc': instance.desc,
      'created_at': instance.createdAt,
    };
