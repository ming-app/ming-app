import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'overview.g.dart';

@JsonSerializable()
class OverviewResponse {
  final int count;
  final Region region;
  final VolunteerOverview volunteerOverview;
  final AnimalOverview animal;

  OverviewResponse(
    this.count,
    this.region,
    this.volunteerOverview,
    this.animal,
  );

  factory OverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$OverviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OverviewResponseToJson(this);
}

class OverviewResponseListTypeConverter
    extends JsonConverter<List<OverviewResponse>, String> {
  @override
  List<OverviewResponse> fromJson(String json) {
    var jsonObject = jsonDecode(json);
    return (jsonObject as List)
        .map((e) => OverviewResponse.fromJson(e))
        .toList();
  }

  @override
  String toJson(List<OverviewResponse> object) {
    return jsonEncode(object.map((e) => e.toJson()).toList());
  }
}

@JsonSerializable()
class Region {
  final String id;
  final String name;
  final String fullName;

  Region(
    this.id,
    this.name,
    this.fullName,
  );

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class VolunteerOverview {
  final int count;
  final List<String> thumbnailUrl;

  VolunteerOverview(this.count, this.thumbnailUrl);

  factory VolunteerOverview.fromJson(Map<String, dynamic> json) =>
      _$VolunteerOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$VolunteerOverviewToJson(this);
}

@JsonSerializable()
class AnimalOverview {
  final int adoptedCount;
  final int inShelterCount;

  AnimalOverview(this.adoptedCount, this.inShelterCount);

  factory AnimalOverview.fromJson(Map<String, dynamic> json) =>
      _$AnimalOverviewFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalOverviewToJson(this);
}
