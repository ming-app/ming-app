// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      json['id'] as String,
      json['user_id'] as String,
      json['animal_id'] as String,
      json['image_url'] as String,
      json['desc'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'animal_id': instance.animalId,
      'image_url': instance.imageUrl,
      'desc': instance.desc,
      'created_at': instance.createdAt,
    };
