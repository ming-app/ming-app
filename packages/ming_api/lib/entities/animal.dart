import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/entities/image.dart';

import 'entities.dart';

part 'animal.g.dart';

@JsonSerializable()
class AnimalOverviewResponse {
  final String id;
  final String name;
  final AnimalGender gender;
  final int age;
  final ImageResponse image;
  final String introduction;
  final UserListOverviewResponse volunteerOverview;

  AnimalOverviewResponse(
    this.id,
    this.name,
    this.gender,
    this.age,
    this.image,
    this.introduction,
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
  final AnimalGender gender;
  final String foundLocation;
  final String birthDay;
  final String relatedAgency;
  final String takeOverDate;
  final int inShelterDays;
  final String introduction;
  final bool neutering;
  final int weightKg;
  final ShelterInfoResponse shelter;
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
    this.gender,
    this.introduction,
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
