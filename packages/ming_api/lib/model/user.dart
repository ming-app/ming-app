import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@CopyWith()
@JsonSerializable()
class User {
  final String uid;
  final String email;
  final String? name;
  final String? introduction;
  final String? snsUrl;

  User(
      {required this.uid,
      required this.email,
      this.name,
      this.introduction,
      this.snsUrl});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.empty() => User(uid: "", email: "");
  bool isEmpty() => uid == User.empty().uid && email == User.empty().email;
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
        uid: uid,
        email: email,
        name: name,
        introduction: introduction,
        snsUrl: snsUrl,
      );
}
