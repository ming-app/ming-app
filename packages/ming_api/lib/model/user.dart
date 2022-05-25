import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String email;
  final String? name;
  final String? introduction;
  final String? snsUrl;

  User(this.uid, this.email, {this.name, this.introduction, this.snsUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserRequest {
  final String? introduction;
  final String? name;
  final String? snsUrl;

  UserRequest({this.introduction, this.name, this.snsUrl});

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  factory UserRequest.fromUser(User user) => UserRequest(
        introduction: user.introduction,
        name: user.name,
        snsUrl: user.snsUrl,
      );
}

@JsonSerializable()
class UserResponse {
  final String? introduction;
  final String? name;
  final String? snsUrl;
  final String email;
  final String uid;

  UserResponse({
    this.introduction,
    this.name,
    required this.email,
    this.snsUrl,
    required this.uid,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toUser() => User(
        uid,
        email,
        name: name,
        introduction: introduction,
        snsUrl: snsUrl,
      );
}
