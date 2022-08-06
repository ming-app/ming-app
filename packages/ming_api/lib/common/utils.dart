import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../entities/entities.dart';

bool typesEqual<T1, T2>() => T1 == T2;

class ListConverter<T> implements JsonConverter<List<T>, Object?> {
  const ListConverter();

  @override
  List<T> fromJson(Object? json) {
    if (json == null) return [];

    if (typesEqual<T, ShelterByRegionResponse>()) {
      return (json as List)
          .map((e) => ShelterByRegionResponse.fromJson(e))
          .toList() as List<T>;
    } else if (typesEqual<T, VolunteerResponse>()) {
      return (json as List).map((e) => VolunteerResponse.fromJson(e)).toList()
          as List<T>;
    } else if (typesEqual<T, RegionResponse>()) {
      return (json as List).map((e) => RegionResponse.fromJson(e)).toList()
          as List<T>;
    }

    throw FormatException("No valid structure for json $json");
  }

  @override
  Object? toJson(List<T> object) {
    throw FormatException(
        "No support for coverting json from entity for list. $json");
  }
}
