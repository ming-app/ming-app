// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['uid'] as String,
      json['email'] as String,
      name: json['name'] as String?,
      introduction: json['introduction'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'introduction': instance.introduction,
      'snsUrl': instance.snsUrl,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      introduction: json['introduction'] as String?,
      name: json['name'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      introduction: json['introduction'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String,
      snsUrl: json['snsUrl'] as String?,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'introduction': instance.introduction,
      'name': instance.name,
      'snsUrl': instance.snsUrl,
      'email': instance.email,
      'uid': instance.uid,
    };
