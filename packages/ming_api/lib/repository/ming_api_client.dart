import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/model/shelter.dart';
import 'package:ming_api/model/user.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ming_api_client.g.dart';

@RestApi(baseUrl: "https://ming-server.herokuapp.com/api/v1/")
abstract class MingApiClient {
  factory MingApiClient(Dio dio, {String? baseUrl}) = _MingApiClient;

  @PUT("users")
  Future<void> updaetUser(
    @Header("Authorization") String token,
    @Body() UserRequest request,
  );

  @GET("users/me")
  Future<ApiResponse<UserResponse>> getUserInfo(
    @Header("Authorization") String token,
  );

  @POST("users/register")
  Future<void> registerUser(@Header("Authorization") String token);
}

String withBearer(String token) {
  return "Bearer $token";
}

@JsonSerializable()
class ApiResponse<T> {
  @_Converter()
  final T result;
  final String resultCode;
  final String resultMessage;

  ApiResponse(this.result, this.resultCode, this.resultMessage);

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}

// generic list converter
class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    if (T == List<ShelterResponse>) {
      return ShelterResponseListTypeConverter().fromJson(jsonEncode(json)) as T;
    } else if (T == UserResponse) {
      return UserResponse.fromJson(json as Map<String, dynamic>) as T;
    }

    throw FormatException("No valid structure for json $json");
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object as Object;
  }
}
