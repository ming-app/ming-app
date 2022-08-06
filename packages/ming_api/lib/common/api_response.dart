import 'package:json_annotation/json_annotation.dart';

import '../entities/entities.dart';
import 'pagination.dart';
import 'utils.dart';

part 'api_response.g.dart';

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

// generic list converter
class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json == null) return null as T;

    if (typesEqual<T, String?>()) {
      return json as T;
    } else if (typesEqual<T, AuthToken?>()) {
      return AuthToken.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, UserInfoResponse?>()) {
      return UserInfoResponse.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, UserDetailInfoResponse?>()) {
      return UserDetailInfoResponse.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, RegionResponse?>()) {
      return RegionResponse.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, AnimalDetailResponse?>()) {
      return AnimalDetailResponse.fromJson(json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, List<RegionResponse>?>()) {
      return const ListConverter<RegionResponse>().fromJson(json) as T;
    } else if (typesEqual<T, List<ShelterByRegionResponse>?>()) {
      return const ListConverter<ShelterByRegionResponse>().fromJson(json) as T;
    } else if (typesEqual<T, List<VolunteerResponse>?>()) {
      return const ListConverter<VolunteerResponse>().fromJson(json) as T;
    } else if (typesEqual<T, PageImpl<ShelterReviewResponse>?>()) {
      return PageImpl<ShelterReviewResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, PageImpl<AnimalOverviewResponse>?>()) {
      return PageImpl<AnimalOverviewResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, PageImpl<ShelterImagesResponse>?>()) {
      return PageImpl<ShelterImagesResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, PageImpl<ShelterOverviewResponse>?>()) {
      return PageImpl<ShelterOverviewResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, PageImpl<ShelterReviewResponse>?>()) {
      return PageImpl<ShelterReviewResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    } else if (typesEqual<T, PageImpl<AnimalJournalResponse>?>()) {
      return PageImpl<AnimalJournalResponse>.fromJson(
          json as Map<String, dynamic>) as T;
    }

    // note : currently dart does not support generic type checking without explicit definition of generic type.

    throw FormatException("No valid structure for json $json");
  }

  @override
  Object? toJson(T? object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object as Map<String, dynamic>?;
  }
}