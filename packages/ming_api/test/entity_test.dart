import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:ming_api/common/api_response.dart';
import 'package:ming_api/common/pagination.dart';
import 'package:ming_api/entities/entities.dart';

import 'resources/raw_json.dart';

void main() {
  group("Entity parsing validation test", () {
    test("Valid auth response", () {
      ApiResponse<AuthToken> result =
          ApiResponse<AuthToken>.fromJson(jsonDecode(authResponseValid));

      expect(result.result!.accessToken, "string");
    });

    test("Valid ApiResponse<PageImpl<ShelterReviewResponse>>", () {
      ApiResponse<Page<ShelterReviewResponse>> result =
          ApiResponse<Page<ShelterReviewResponse>>.fromJson(
              jsonDecode(shelterReviewResponseValid));

      expect(result.result!.content[0].comment, "string");
    }, skip: true);

    test("Valid ApiResponse<List<ShelterByRegionResponse>>", () {
      ApiResponse<List<ShelterByRegionResponse>> result =
          ApiResponse<List<ShelterByRegionResponse>>.fromJson(
              jsonDecode(homeShelterOverviewValid));

      expect(result.result![0].adoptedAnimalCount, 0);
    });
  });
}
