import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/entities/image.dart';

import '../common/utils.dart';
import 'entities.dart';

part 'shelter.g.dart';

@JsonSerializable()
class AnimalInShelterOverview {
  final int count;
  final AnimalType type;

  AnimalInShelterOverview(this.count, this.type);

  factory AnimalInShelterOverview.fromJson(Map<String, dynamic> json) =>
      _$AnimalInShelterOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalInShelterOverviewToJson(this);
}

@JsonSerializable()
class ShelterByRegionResponse {
  final int adoptedAnimalCount;
  final int animalInShelterCount;
  final int count;
  final RegionResponse region;
  final UserListOverviewResponse volunteerOverview;

  ShelterByRegionResponse(
    this.adoptedAnimalCount,
    this.animalInShelterCount,
    this.count,
    this.region,
    this.volunteerOverview,
  );

  factory ShelterByRegionResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterByRegionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterByRegionResponseToJson(this);
}

@JsonSerializable()
class ShelterImagesResponse {
  final String id;
  final String thumbnailUrl;

  ShelterImagesResponse(this.id, this.thumbnailUrl);

  factory ShelterImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterImagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterImagesResponseToJson(this);
}

@JsonSerializable()
class ShelterInfoResponse {
  final String id;
  final String name;
  final String introduction;
  final String location;
  final String phoneNumber;
  final String adminName;
  final ImageResponse image;
  final String? snsUrl;
  final UserListOverviewResponse volunteerOverview;
  @ListConverter<AnimalInShelterOverview>()
  final List<AnimalInShelterOverview> animalOverview;
  final RegionResponse region;

  ShelterInfoResponse(
    this.id,
    this.name,
    this.introduction,
    this.location,
    this.phoneNumber,
    this.adminName,
    this.snsUrl,
    this.image,
    this.volunteerOverview,
    this.animalOverview,
    this.region,
  );

  factory ShelterInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterInfoResponseToJson(this);
}
