import 'package:json_annotation/json_annotation.dart';
import 'package:ming_api/entities/image.dart';

part 'user.g.dart';

@JsonSerializable()
class UserInfoResponse {
  final String id;
  final String name;
  final ImageResponse image;

  UserInfoResponse(this.id, this.name, this.image);

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoResponseToJson(this);
}

@JsonSerializable()
class UserDetailInfoResponse {
  final String id;
  final String name;
  final ImageResponse image;
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
    this.image,
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
class UpdateUserRequest {
  final String? address;
  final String? imageId;
  final String? introduction;
  final String? birthday;
  final UserGender? gender;
  final String? snsUrl;

  UpdateUserRequest({
    this.address,
    this.imageId,
    this.introduction,
    this.snsUrl,
    this.birthday,
    this.gender,
  });

  factory UpdateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
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

  @override
  String toString() {
    if (this == female) {
      return "여성";
    } else if (this == male) {
      return "남성";
    }
    return "없음";
  }
}
