import 'package:json_annotation/json_annotation.dart';

part 'pet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Pet {
  final String id;
  final String name;
  final String birth;
  final List<String> imageUrls;
  final String desc;

  Pet(this.id, this.name, this.birth, this.imageUrls, this.desc);

  Map<String, dynamic> toJson() => _$PetToJson(this);

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);
}
