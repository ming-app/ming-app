import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ming_api/ming_api.dart';
import 'package:ming_api/repository/ming_api_client.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([Dio])
void main() {
  group('User Api Test', () {
    const token = "TEST_TOKEN";
    late MingApiRepository repository;
    late MockWebServer server;

    setUp(() async {
      server = MockWebServer(port: 8081);
      await server.start();
      repository = MingApiRepository(baseUrl: server.url);
    });

    tearDown(() async {
      await server.shutdown();
    });

    test("Test register user with token", () async {
      server.enqueue();
      await repository.registerUser(token);

      var request = server.takeRequest();
      expect(request.headers['authorization'], "Bearer TEST_TOKEN");
    });

    test("Test updating user", () async {
      server.enqueue();
      await repository.updateUserInfo(
        token,
        User("TEST", "test@test.com", name: "TEST_NAME"),
      );

      var request = server.takeRequest();
      expect(request.body!.contains("TEST_NAME"), true);
    });

    test("Test getting my user", () async {
      server.enqueue(
        body: jsonEncode(ApiResponse<UserResponse>(
          resultCode: "OK",
          result: UserResponse(uid: "TEST_UID", email: "test@test.com"),
        ).toJson()),
        headers: {"Content-Type": "application/json"},
        httpCode: 201,
      );

      var user = await repository.getUserInfo(token);

      expect(user.email, "test@test.com");
      expect(user.uid, "TEST_UID");
    });

    test("Test get authorized shetlers", () async {
      server.enqueue(
        body: jsonEncode(ApiResponse<List<ShelterResponse>>(
                result: [ShelterResponse(id: 123, name: "TEST_SHELTER")],
                resultCode: "OK")
            .toJson()),
        headers: {"Content-Type": "application/json"},
        httpCode: 201,
      );

      var list = await repository.getAuthorizedShelters(token);

      expect(list.first.id, 123);
    });

    test("Test updating shelter information", () async {
      server.enqueue();

      await repository.updateShelterInfo(
          token, Shelter(123, "TEST_SHELTER", introduction: "HI"));
      var request = server.takeRequest();

      expect(request.body!.contains("HI"), true);
      expect(request.headers['authorization'], "Bearer TEST_TOKEN");
    });

    test("Test get animals in the shelter", () async {
      server.enqueue(
        body: jsonEncode(
          ApiResponse<List<AnimalResponse>>(resultCode: "OK", result: [
            AnimalResponse(
                123, "TEST_NAME", "TEST_INTRO", "2022", "TEST_URL", 124),
          ]).toJson(),
        ),
        headers: {"Content-Type": "application/json"},
        httpCode: 201,
      );

      var list =
          await repository.getAnimalsInShelter(Shelter(124, "TEST_NAME"));

      var request = server.takeRequest();

      expect(request.uri.path.contains("124"), true);
      expect(list.length, 1);
      expect(list.first.birthYear, "2022");
    });

    test("Test authenticate user to shelter", () async {
      server.enqueue();

      await repository.authenticateUserToShelter(
          token, "test@test.com", Shelter(124, "TEST_NAME"));

      var request = server.takeRequest();

      expect(request.body!.contains("test@test.com"), true);
    });

    test("Test registering animal", () async {
      server.enqueue();

      await repository.registerAnimal(token,
          Animal(123, 124, "TEST_NAME", "TEST_INTRO", "2022", "TEST_URL"));

      var request = server.takeRequest();

      expect(request.body!.contains("2022"), true);
    });
  });
}
