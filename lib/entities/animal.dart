import 'package:json_annotation/json_annotation.dart';

part 'animal.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Animal {
  final String id;
  final String shelterId;
  final String name;
  final String imageUrl;
  final String desc;
  final String createdAt;
  Animal(this.id, this.shelterId, this.name, this.imageUrl, this.desc, this.createdAt);

  Map<String, dynamic> toJson() => _$AnimalToJson(this);

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
}
