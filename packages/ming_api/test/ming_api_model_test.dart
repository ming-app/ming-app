import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ming_api/model/shelter.dart';
import 'package:ming_api/model/user.dart';
import 'package:ming_api/repository/ming_api_client.dart';

void main() {
  group("Test Model for User Controller", () {
    test("Test UserRequest", () {
      const json = '''
      {
        "introduction": "intro",
        "name": "nameText",
        "snsUrl": "instagram.com/bla"
      }
      ''';

      final result = UserRequest.fromJson(jsonDecode(json));
      expect(result.introduction, "intro");
      expect(result.name, "nameText");
      expect(result.snsUrl, "instagram.com/bla");
    });

    test("Test UserResponse", () {
      const json = '''
      {
        "email": "test@test.com",
        "introduction": "intro",
        "name": "nameText",
        "registeredAt": {
          "date": 1,
          "day": 1,
          "hours": 1,
          "minutes": 1,
          "month": 1,
          "nanos": 1,
          "seconds" : 1,
          "time": 1,
          "timeznoeOffset": 1,
          "year": 1
        },
        "snsUrl": "instagram.com/bla",
        "uid": "uidblablabla"
      }
      ''';

      final result = UserResponse.fromJson(jsonDecode(json));
      expect(result.introduction, "intro");
      expect(result.name, "nameText");
      expect(result.snsUrl, "instagram.com/bla");
    });

    test("Test ApiResponse<UserResponse>", () {
      const json = '''
      {
        "result": {
          "email": "test@test.com",
          "introduction": "intro",
          "name": "nameText",
          "registeredAt": {
            "date": 1,
            "day": 1,
            "hours": 1,
            "minutes": 1,
            "month": 1,
            "nanos": 1,
            "seconds" : 1,
            "time": 1,
            "timeznoeOffset": 1,
            "year": 1
          },
          "snsUrl": "instagram.com/bla",
          "uid": "uidblablabla"
        },
        "resultCode": "OK",
        "resultMessage": "OK"
      }
      ''';

      final result = ApiResponse<UserResponse>.fromJson(jsonDecode(json));
      expect(result.result, isA<UserResponse>());
      expect(result.resultCode, "OK");
    });

    test("Test null result of ApiResponse<UserResponse>", () {
      const json = '''
      {
        "resultCode": "OK",
        "resultMessage": "OK"
      }
      ''';

      final result = ApiResponse<UserResponse>.fromJson(jsonDecode(json));
      expect(result.result, isA<UserResponse?>());
      expect(result.resultCode, "OK");
    });
  });

  group("Test Model for shelter Controller", () {
    test("Test ShelterRegisterRequest", () {
      const json = '''
      {
        "name": "nameText"
      }
      ''';

      final result = ShelterRegisterRequest.fromJson(jsonDecode(json));
      expect(result.name, "nameText");
    });

    test("Test ShelterResponse", () {
      const json = '''
      {
        "id": 4,
        "introduction": "intro",
        "name": "nameText",
        "phoneNumber": "010-0000-0000",
        "snsUrl": "instagram.com/bla"
      }
      ''';

      final result = ShelterResponse.fromJson(jsonDecode(json));
      expect(result.introduction, "intro");
      expect(result.name, "nameText");
      expect(result.snsUrl, "instagram.com/bla");
    });

    test("Test ApiResponse<List<ShelterResponse>>", () {
      const json = '''
      {
        "result": [
          {
            "id": 4,
            "introduction": "intro",
            "name": "nameText",
            "phoneNumber": "010-0000-0000",
            "snsUrl": "instagram.com/bla"
          },
          {
            "id": 4,
            "introduction": "intro",
            "name": "nameText",
            "phoneNumber": "010-0000-0000",
            "snsUrl": "instagram.com/bla"
          }
        ],
        "resultCode": "OK",
        "resultMessage": "OK"
      }
      ''';

      final result =
          ApiResponse<List<ShelterResponse>>.fromJson(jsonDecode(json));
      expect(result.result, isA<List<ShelterResponse>>());
      expect(result.result!.length, 2);
      expect(result.resultCode, "OK");
    });

    test("Test null result with ApiResponse<List<ShelterResponse>>", () {
      const json = '''
      {
        "resultCode": "OK",
        "resultMessage": "OK"
      }
      ''';

      final result =
          ApiResponse<List<ShelterResponse>>.fromJson(jsonDecode(json));
      expect(result.result, isA<List<ShelterResponse>?>());
      expect(result.resultCode, "OK");
    });
  });
}
