// Facade API repository for ming server API.
import 'package:dio/dio.dart';
import 'package:ming_api/repository/api_client.dart';

class MingApiRepository {
  final MingApiClient client;

  MingApiRepository({Dio? dio, String? baseUrl})
      : client = MingApiClient(dio ?? Dio(), baseUrl: baseUrl);
}

String withBearer(String token) {
  return "Bearer $token";
}
