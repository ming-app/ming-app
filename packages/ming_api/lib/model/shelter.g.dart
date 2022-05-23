// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShelterRegisterRequest _$ShelterRegisterRequestFromJson(
        Map<String, dynamic> json) =>
    ShelterRegisterRequest(
      json['name'] as String,
      json['shelterAdminUid'] as String,
    );

Map<String, dynamic> _$ShelterRegisterRequestToJson(
        ShelterRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shelterAdminUid': instance.shelterAdminUid,
    };

ShelterResponse _$ShelterResponseFromJson(Map<String, dynamic> json) =>
    ShelterResponse(
      json['id'] as int,
      json['introduction'] as String,
      json['name'] as String,
      json['phoneNumber'] as String,
      json['snsUrl'] as String,
    );

Map<String, dynamic> _$ShelterResponseToJson(ShelterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'introduction': instance.introduction,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
    };

RegisterUserToShelterRequest _$RegisterUserToShelterRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterUserToShelterRequest();

Map<String, dynamic> _$RegisterUserToShelterRequestToJson(
        RegisterUserToShelterRequest instance) =>
    <String, dynamic>{};
