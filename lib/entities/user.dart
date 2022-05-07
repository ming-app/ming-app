import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String id;
  final String loginId;
  final String pwd;
  final List<String> shelterId;
  final List<String> consentTermIds;

  User(this.id, this.loginId, this.pwd, this.shelterId, this.consentTermIds);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
