// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      json['introduction'] as String,
      json['name'] as String,
      json['snsUrl'] as String,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['introduction'] as String,
      json['name'] as String,
      json['email'] as String,
      json['snsUrl'] as String,
      json['uid'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
      'email': instance.email,
      'uid': instance.uid,
    };
