// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoResponse _$UserInfoResponseFromJson(Map<String, dynamic> json) =>
    UserInfoResponse(
      json['id'] as String,
      json['name'] as String,
      ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserInfoResponseToJson(UserInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };

UserDetailInfoResponse _$UserDetailInfoResponseFromJson(
        Map<String, dynamic> json) =>
    UserDetailInfoResponse(
      json['id'] as String,
      json['name'] as String,
      ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      json['email'] as String,
      json['isOfferedIdentification'] as bool,
      phoneNumber: json['phoneNumber'] as String?,
      snsUrl: json['snsUrl'] as String?,
      introduction: json['introduction'] as String?,
      birthday: json['birthday'] as String?,
      address: json['address'] as String?,
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$UserDetailInfoResponseToJson(
        UserDetailInfoResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'email': instance.email,
      'isOfferedIdentification': instance.isOfferedIdentification,
      'phoneNumber': instance.phoneNumber,
      'snsUrl': instance.snsUrl,
      'introduction': instance.introduction,
      'birthday': instance.birthday,
      'address': instance.address,
      'gender': _$UserGenderEnumMap[instance.gender],
    };

const _$UserGenderEnumMap = {
  UserGender.female: 'FEMALE',
  UserGender.male: 'MALE',
};

UpdateUserRequest _$UpdateUserRequestFromJson(Map<String, dynamic> json) =>
    UpdateUserRequest(
      address: json['address'] as String?,
      imageId: json['imageId'] as String?,
      introduction: json['introduction'] as String?,
      snsUrl: json['snsUrl'] as String?,
      birthday: json['birthday'] as String?,
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']),
    );

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) =>
    <String, dynamic>{
      'address': instance.address,
      'imageId': instance.imageId,
      'introduction': instance.introduction,
      'birthday': instance.birthday,
      'gender': _$UserGenderEnumMap[instance.gender],
      'snsUrl': instance.snsUrl,
    };

UserListOverviewResponse _$UserListOverviewResponseFromJson(
        Map<String, dynamic> json) =>
    UserListOverviewResponse(
      json['count'] as int,
      (json['thumbnailUrl'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserListOverviewResponseToJson(
        UserListOverviewResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'thumbnailUrl': instance.thumbnailUrl,
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

VolunteerRequest _$VolunteerRequestFromJson(Map<String, dynamic> json) =>
    VolunteerRequest(
      json['id'] as String,
      personnel: json['personnel'] as int?,
    );

Map<String, dynamic> _$VolunteerRequestToJson(VolunteerRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'personnel': instance.personnel,
    };

VolunteerResponse _$VolunteerResponseFromJson(Map<String, dynamic> json) =>
    VolunteerResponse(
      json['id'] as String,
      json['dateTime'] as String,
      json['availableCount'] as int,
      VolunteerOverview.fromJson(
          json['volunteerOverview'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VolunteerResponseToJson(VolunteerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dateTime': instance.dateTime,
      'availableCount': instance.availableCount,
      'volunteerOverview': instance.volunteerOverview,
    };
