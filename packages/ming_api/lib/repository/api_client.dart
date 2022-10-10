import 'package:dio/dio.dart';
import 'package:ming_api/common/api_response.dart';
import 'package:retrofit/retrofit.dart';

import '../common/pagination.dart';
import '../entities/entities.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://ming-server.herokuapp.com/")
abstract class MingApiClient {
  factory MingApiClient(Dio dio, {String? baseUrl}) = _MingApiClient;

  // Region
  @GET("api/v1/meta/regions")
  Future<ApiResponse<List<RegionResponse>>> getRegionInfos({
    @Query("regionId") String? id,
  });

  // Animal
  @GET("api/v1/animals/{id}")
  Future<ApiResponse<AnimalDetailResponse>> getAnimalDetail(
    @Path() String id,
  );

  @GET("api/v1/animals/{id}/journals")
  Future<ApiResponse<Page<AnimalJournalResponse>>> getAnimalJournals(
    @Path() String id,
  );

  // Shelter
  @GET("api/v1/shelters/overview")
  Future<ApiResponse<List<ShelterByRegionResponse>>> getSheltersRegionalInfo();

  @GET("api/v1/shelters")
  Future<ApiResponse<Page<ShelterInfoResponse>>> getShelters({
    @Query("regionId") String? regionId,
    @Query("size") int? size,
    @Query("page") int? page,
  });

  @GET("api/v1/shelters/{id}")
  Future<ApiResponse<ShelterInfoResponse>> getShelter(
    @Path() String id,
  );

  @GET("api/v1/shelters/{id}/animals")
  Future<ApiResponse<Page<AnimalOverviewResponse>>> getAnimalInShelter(
    @Path() String id, {
    @Query("size") int? size,
    @Query("page") int? page,
  });

  @GET("api/v1/shelters/{id}/images")
  Future<ApiResponse<Page<ShelterImagesResponse>>> getSheltersImage(
    @Path() String id, {
    @Query("size") int? size,
    @Query("page") int? page,
  });

  @GET("api/v1/shelters/{id}/reviews")
  Future<ApiResponse<Page<ShelterReviewResponse>>> getReviews(
    @Path() String id, {
    @Query("size") int? size,
    @Query("page") int? page,
  });

  // Volunteer
  @GET("api/v1/volunteers")
  Future<ApiResponse<List<VolunteerResponse>>> getVolunteerActivities(
    @Query("yearMonth") String yearMonth,
  );

  @POST("api/v1/volunteers")
  Future<ApiResponse<String>> applyVolunteerActivity(
    @Header("Authorization") String token,
    @Body() VolunteerRequest request, {
    @Header("loginType") String type = "KAKAO_TALK",
  });

  // User
  @GET("api/v1/users/info")
  Future<ApiResponse<UserInfoResponse>> getUserInfo(
    @Header("Authorization") String token, {
    @Header("loginType") String type = "KAKAO_TALK",
  });

  @GET("api/v1/users/detail-info")
  Future<ApiResponse<UserDetailInfoResponse>> getUserDetailInfo(
    @Header("Authorization") String token, {
    @Header("loginType") String type = "KAKAO_TALK",
  });

  @GET("api/v1/users/token")
  Future<ApiResponse<AuthToken>> getAccessTokenFromKakaoCode(
    @Query("code") String code,
    @Query("redirectUrl") String redirectUrl,
  );

  @GET("")
  Future<AuthToken> refreshToken(
    @Header("refreshToken") String token,
    @Header("loginType") String loginType,
  );
}
