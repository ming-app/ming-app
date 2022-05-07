// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as String,
      json['login_id'] as String,
      json['pwd'] as String,
      (json['shelter_id'] as List<dynamic>).map((e) => e as String).toList(),
      (json['consent_term_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'login_id': instance.loginId,
      'pwd': instance.pwd,
      'shelter_id': instance.shelterId,
      'consent_term_ids': instance.consentTermIds,
    };
