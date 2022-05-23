import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserRequest {
  final String introduction;
  final String name;
  final String snsUrl;

  UserRequest(this.introduction, this.name, this.snsUrl);

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}

@JsonSerializable()
class UserResponse {
  final String introduction;
  final String name;
  final String snsUrl;
  final String email;
  final String uid;

  UserResponse(this.introduction, this.name, this.email, this.snsUrl, this.uid);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
