import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/model.dart';

part 'ming_api_client.g.dart';

@RestApi(baseUrl: "https://ming-server.herokuapp.com/api/")
abstract class MingApiClient {
  factory MingApiClient(Dio dio, {String? baseUrl}) = _MingApiClient;

  // USER
  @PUT("v1/users")
  Future<void> updateUser(
    @Header("Authorization") String token,
    @Body() UserRequest request,
  );

  @GET("v1/users/me")
  Future<ApiResponse<UserResponse>> getUserInfo(
    @Header("Authorization") String token,
  );

  @POST("v1/users/register")
  Future<void> registerUser(@Header("Authorization") String token);

  // SHELTER
  @GET("v1/shelters")
  Future<ApiResponse<List<ShelterResponse>>> getAuthorizedShelters(
      @Header("Authorization") String token);

  @PUT("v1/shelters")
  Future<void> updateShelterInfo(
    @Header("Authorization") String token,
    @Body() ShelterUpdateRequest request,
  );

  @GET("v1/shelters/{id}/animals")
  Future<ApiResponse<List<AnimalResponse>>> getAnimalsInShelter(
    @Path() id,
  );

  @POST("v1/shelters/register-user")
  Future<void> authenticateUserToShelter(
    @Header("Authorization") String token,
    @Body() RegisterUserToShelterRequest request,
  );

  // Animals
  @POST("v1/animals/register")
  Future<void> registerAnimal(
    @Header("Authorization") String token,
    @Body() AnimalRegisterRequest request,
  );
}

String withBearer(String token) {
  return "Bearer $token";
}

@JsonSerializable()
class ApiResponse<T> {
  @_Converter()
  final T? result;
  final String resultCode;
  final String? resultMessage;

  ApiResponse({this.result, required this.resultCode, this.resultMessage});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  @override
  String toString() {
    return "$resultCode: $resultMessage";
  }
}

bool typesEqual<T1, T2>() => T1 == T2;

// generic list converter
class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json == null) return null as T;

    if (typesEqual<T, List<ShelterResponse>?>()) {
      return ShelterResponseListTypeConverter().fromJson(jsonEncode(json)) as T;
    } else if (typesEqual<T, UserResponse?>()) {
      return UserResponse.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, List<AnimalResponse>?>()) {
      return AnimalResponseListTypeConverter().fromJson(jsonEncode(json)) as T;
    }
    throw FormatException("No valid structure for json $json");
  }

  @override
  Object toJson(T? object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object as Object;
  }
}
