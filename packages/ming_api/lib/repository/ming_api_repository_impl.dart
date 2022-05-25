import 'package:log/log.dart';
import 'package:ming_api/model/model.dart';
import 'package:ming_api/repository/ming_api_client.dart';
import 'package:ming_api/repository/ming_api_repository.dart';

class MingApiRepositoryImpl implements MingApiRepository {
  final MingApiClient _client;

  MingApiRepositoryImpl(this._client);

  @override
  Future<void> authenticateUserToShelter(
      String token, String email, Shelter shelter) {
    return _client.authenticateUserToShelter(
      withBearer(token),
      RegisterUserToShelterRequest(shelter.id, email),
    );
  }

  @override
  Future<List<Animal>> getAnimalsInShelter(Shelter shelter) async {
    var response = await _client.getAnimalsInShelter(shelter.id);
    Log.d("$response");
    _handleNullApiResult(response);

    return response.result!.map((e) => e.toAnimal()).toList();
  }

  @override
  Future<List<Shelter>> getAuthorizedShelters(String token) async {
    var response = await _client.getAuthorizedShelters(withBearer(token));
    Log.d("$response");
    _handleNullApiResult(response);

    return response.result!.map((e) => e.toShelter()).toList();
  }

  @override
  Future<User> getUserInfo(String token) async {
    var response = await _client.getUserInfo(withBearer(token));
    Log.d("$response");
    _handleNullApiResult(response);

    return response.result!.toUser();
  }

  @override
  Future<void> registerAnimal(String token, Animal animal) {
    return _client.registerAnimal(
        withBearer(token), AnimalRegisterRequest.fromAnimal(animal));
  }

  @override
  Future<void> registerUser(String token) {
    return _client.registerUser(withBearer(token));
  }

  @override
  Future<void> updateShelterInfo(String token, Shelter shelter) {
    return _client.updateShelterInfo(
      withBearer(token),
      ShelterUpdateRequest.fromShelter(shelter),
    );
  }

  @override
  Future<void> updateUserInfo(String token, User user) {
    return _client.updateUser(withBearer(token), UserRequest.fromUser(user));
  }

  void _handleNullApiResult<T>(ApiResponse<T> response) {
    if (response.result == null) {
      Log.e("$response");
      throw MingApiException("$response");
    }
  }
}
