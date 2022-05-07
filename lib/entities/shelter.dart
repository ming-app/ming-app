import 'package:json_annotation/json_annotation.dart';

part 'shelter.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Shelter {
  final String id;
  final String name;
  final String imageUrl;
  final String instagramUrl;
  final String email;
  final String phoneNumber;
  final String desc;
  final String createdAt;

  Shelter(this.id, this.name, this.imageUrl, this.instagramUrl, this.email, this.phoneNumber, this.desc, this.createdAt);

  Map<String, dynamic> toJson() => _$ShelterToJson(this);

  factory Shelter.fromJson(Map<String, dynamic> json) => _$ShelterFromJson(json);
}
