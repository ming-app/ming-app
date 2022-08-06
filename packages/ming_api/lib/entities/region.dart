import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/common/utils.dart';

part 'region.g.dart';

@JsonSerializable()
class RegionResponse {
  final String id;
  final String fullName;
  final String name;
  @ListConverter()
  final List<RegionResponse>? underRegion;

  RegionResponse(
    this.id,
    this.fullName,
    this.name, {
    this.underRegion,
  });

  factory RegionResponse.fromJson(Map<String, dynamic> json) =>
      _$RegionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegionResponseToJson(this);
}
