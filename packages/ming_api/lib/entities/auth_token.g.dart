// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => AuthToken(
      json['accessToken'] as String,
      json['refreshToken'] as String,
      json['tokenType'] as String,
      json['expiresIn'] as int,
      json['refreshTokenExpiresIn'] as int,
    );

Map<String, dynamic> _$AuthTokenToJson(AuthToken instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'refreshTokenExpiresIn': instance.refreshTokenExpiresIn,
    };
