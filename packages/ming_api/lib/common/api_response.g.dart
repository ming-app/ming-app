// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) =>
    ApiResponse<T>(
      result: _Converter<T?>().fromJson(json['result']),
      resultCode: json['resultCode'] as String,
      resultMessage: json['resultMessage'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(ApiResponse<T> instance) =>
    <String, dynamic>{
      'result': _Converter<T?>().toJson(instance.result),
      'resultCode': instance.resultCode,
      'resultMessage': instance.resultMessage,
    };
