import 'package:json_annotation/json_annotation.dart';

import 'entities.dart';

part 'animal.g.dart';

@JsonSerializable()
class AnimalOverviewResponse {
  final String id;
  final String name;
  final AnimalGender gender;
  final int age;
  final String thumbnailUrl;
  final String description;
  final UserListOverviewResponse volunteerOverview;

  AnimalOverviewResponse(
    this.id,
    this.name,
    this.gender,
    this.age,
    this.thumbnailUrl,
    this.description,
    this.volunteerOverview,
  );

  factory AnimalOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalOverviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalOverviewResponseToJson(this);
}

@JsonSerializable()
class AnimalDetailResponse {
  final String id;
  final String name;
  final AnimalType type;
  final String kind;
  final String foundLocation;
  final String birthDay;
  final String relatedAgency;
  final String takeOverDate;
  final int inShelterDays;
  final bool neutering;
  final int weightKg;
  final ShelterOverviewResponse shelter;
  final UserListOverviewResponse volunteerOverview;

  AnimalDetailResponse(
    this.id,
    this.name,
    this.type,
    this.kind,
    this.foundLocation,
    this.birthDay,
    this.relatedAgency,
    this.takeOverDate,
    this.inShelterDays,
    this.neutering,
    this.weightKg,
    this.shelter,
    this.volunteerOverview,
  );

  factory AnimalDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalDetailResponseToJson(this);
}

enum AnimalType {
  @JsonValue("CAT")
  cat,
  @JsonValue("DOG")
  dog,
  ;
}

enum AnimalGender {
  @JsonValue("FEMALE")
  female,
  @JsonValue("MALE")
  male,
  ;
}
