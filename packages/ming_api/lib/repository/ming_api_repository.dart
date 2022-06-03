import 'package:dio/dio.dart';
import 'package:log/log.dart';
import 'package:ming_api/repository/ming_api_client.dart';

import '../model/model.dart';
import 'ming_api_repository_impl.dart';

abstract class MingApiRepository {
  factory MingApiRepository({Dio? dio, String? baseUrl, bool logging = false}) {
    var dioInternal = dio ?? Dio();
    if (logging) {
      dioInternal.interceptors.add(Log.dioInterceptor);
    }

    return MingApiRepositoryImpl(MingApiClient(dioInternal, baseUrl: baseUrl));
  }

  // User info.
  Future<void> registerUser(String token);
  Future<void> updateUserInfo(String token, User user);
  Future<User> getUserInfo(String token);

  // shelter info.
  Future<List<Shelter>> getAuthorizedShelters(String token);
  Future<void> updateShelterInfo(String token, Shelter shelter);
  Future<void> authenticateUserToShelter(
      String token, String email, Shelter shelter);

  // animal info.
  Future<void> registerAnimal(String token, Animal animal);
  Future<List<Animal>> getAnimalsInShelter(Shelter shelter);
}

class MingApiException implements Exception {
  final String message;

  MingApiException(this.message);
}
