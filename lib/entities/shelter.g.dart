// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shelter _$ShelterFromJson(Map<String, dynamic> json) => Shelter(
      json['id'] as String,
      json['name'] as String,
      json['image_url'] as String,
      json['instagram_url'] as String,
      json['email'] as String,
      json['phone_number'] as String,
      json['desc'] as String,
      json['created_at'] as String,
    );

Map<String, dynamic> _$ShelterToJson(Shelter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'instagram_url': instance.instagramUrl,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'desc': instance.desc,
      'created_at': instance.createdAt,
    };
