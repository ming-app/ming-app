// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shelter _$ShelterFromJson(Map<String, dynamic> json) => Shelter(
      json['id'] as int,
      json['name'] as String,
      introduction: json['introduction'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$ShelterToJson(Shelter instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

ShelterRegisterRequest _$ShelterRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    ShelterRegisterRequest(
      json['name'] as String,
    );

Map<String, dynamic> _$ShelterRegisterRequestToJson(
        ShelterRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

ShelterUpdateRequest _$ShelterUpdateRequestFromJson(
        Map<String, dynamic> json) =>
    ShelterUpdateRequest(
      json['shelterId'] as int,
      introduction: json['introduction'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$ShelterUpdateRequestToJson(
        ShelterUpdateRequest instance) =>
    <String, dynamic>{
      'shelterId': instance.shelterId,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

ShelterResponse _$ShelterResponseFromJson(Map<String, dynamic> json) =>
    ShelterResponse(
      id: json['id'] as int,
      introduction: json['introduction'] as String?,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
    );

Map<String, dynamic> _$ShelterResponseToJson(ShelterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'introduction': instance.introduction,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

RegisterUserToShelterRequest _$RegisterUserToShelterRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterUserToShelterRequest(
      json['shelterId'] as int,
      json['userEmail'] as String,
    );

Map<String, dynamic> _$RegisterUserToShelterRequestToJson(
        RegisterUserToShelterRequest instance) =>
    <String, dynamic>{
      'shelterId': instance.shelterId,
      'userEmail': instance.userEmail,
    };
