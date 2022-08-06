import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final String id;
  final String name;
  final String thumbnailUrl;

  UserInfoResponse(this.id, this.name, this.thumbnailUrl);

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class UserDetailInfoResponse {
  final String id;
  final String name;
  final String thumbnailUrl;
  final String email;
  final bool isOfferedIdentification;
  final String? phoneNumber;
  final String? snsUrl;
  final String? introduction;
  final String? birthday;
  final String? address;
  final UserGender? gender;

  UserDetailInfoResponse(
    this.id,
    this.name,
    this.thumbnailUrl,
    this.email,
    this.isOfferedIdentification, {
    this.phoneNumber,
    this.snsUrl,
    this.introduction,
    this.birthday,
    this.address,
    this.gender,
  });

  factory UserDetailInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailInfoResponseToJson(this);
}

@JsonSerializable()
class UserListOverviewResponse {
  final int count;
  final List<String> thumbnailUrl;

  UserListOverviewResponse(this.count, this.thumbnailUrl);

  factory UserListOverviewResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListOverviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserListOverviewResponseToJson(this);
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
class VolunteerRequest {
  final String id;
  final int? personnel;

  VolunteerRequest(this.id, {this.personnel});

  factory VolunteerRequest.fromJson(Map<String, dynamic> json) =>
      _$VolunteerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VolunteerRequestToJson(this);
}

@JsonSerializable()
class VolunteerResponse {
  final String id;
  final String dateTime;
  final int availableCount;
  final VolunteerOverview volunteerOverview;

  VolunteerResponse(
    this.id,
    this.dateTime,
    this.availableCount,
    this.volunteerOverview,
  );

  factory VolunteerResponse.fromJson(Map<String, dynamic> json) =>
      _$VolunteerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VolunteerResponseToJson(this);
}

enum UserGender {
  @JsonValue("FEMALE")
  female,
  @JsonValue("MALE")
  male,
  ;
}
