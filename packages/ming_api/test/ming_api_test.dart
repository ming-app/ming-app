import 'package:flutter_test/flutter_test.dart';
import 'package:ming_api/entities/image.dart';

import 'package:ming_api/ming_api.dart';

void main() {
  late MingApiRepository repository;

  setUp(() {
    repository = MingApiRepository();
  });

  group("Region API Test", () {
    test("GET v1/meta/regions, Positive", () async {
      var result = await repository.client.getRegionInfos();

      expect(result.result!.isNotEmpty, true);
    });
  });

  group("Animal API Test", () {
    test("GET v1/animals/{id}, Positive", () async {
      var result = await repository.client.getAnimalDetail("1");

      expect(result.result != null, true);
    });

    test("GET v1/animals/{id}/journals, Positive", () async {
      var result = await repository.client.getAnimalJournals("1");

      expect(result.result!.numberOfElements > 0, true);
    }, skip: true);
  });

  group("Shelter API Test", () {
    test("GET v1/shelters/overview, Positive", () async {
      var result = await repository.client.getSheltersRegionalInfo();

      expect(result.result!.isNotEmpty, true);
    });

    test("GET v1/shelters, Positive", () async {
      var result = await repository.client.getShelters();

      expect(result.result!.content.isNotEmpty, true);
    });

    test("GET v1/shelters/{id}", () async {
      var result = await repository.client.getShelter("1");

      expect(result.result != null, true);
    });

    test("GET v1/shelters/{id}/animals, Positive", () async {
      var result = await repository.client.getAnimalInShelter("1");

      expect(result.result!.content.isNotEmpty, true);
    });

    test("GET v1/shelters/{id}/images, Positive", () async {
      var result = await repository.client.getSheltersImage("1");

      expect(result.result!.content.isNotEmpty, true);
    });

    test("GET v1/shelters/{id}/reviews, Positive", () async {
      var result = await repository.client.getReviews("1");

      expect(result.result!.content.isNotEmpty, true);
    }, skip: true);
  });

  group("Volunteer API Test", () {
    test("GET v1/volunteers, Positive", () async {
      var result = await repository.client.getVolunteerActivities("2022-01");

      expect(result.result!.isNotEmpty, true);
    });
  });

  group("Image API Test", () {
    test("GET v1/images, positive", () async {
      var result = await repository.client.getImages();

      expect(result.result!.content.isNotEmpty, true);
    });
  });
}
