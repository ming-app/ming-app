import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'animal.g.dart';

@JsonSerializable()
class Animal {
  final int id;
  final int shelterId;
  final String name;
  final String introduction;
  final String birthYear;
  final String imageUrl;

  Animal(
    this.id,
    this.shelterId,
    this.name,
    this.introduction,
    this.birthYear,
    this.imageUrl,
  );

  factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalToJson(this);
}

@JsonSerializable()
class AnimalRegisterRequest {
  final AnimalInfo animalInfo;
  final int shelterId;

  AnimalRegisterRequest(this.animalInfo, this.shelterId);

  factory AnimalRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$AnimalRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalRegisterRequestToJson(this);

  factory AnimalRegisterRequest.fromAnimal(Animal animal) =>
      AnimalRegisterRequest(
        AnimalInfo(
          animal.name,
          animal.introduction,
          animal.birthYear,
          animal.imageUrl,
        ),
        animal.shelterId,
      );
}

@JsonSerializable()
class AnimalInfo {
  final String name;
  final String introduction;
  final String birthYear;
  final String imageUrl;

  AnimalInfo(this.name, this.introduction, this.birthYear, this.imageUrl);

  factory AnimalInfo.fromJson(Map<String, dynamic> json) =>
      _$AnimalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalInfoToJson(this);
}

@JsonSerializable()
class AnimalResponse {
  final int id;
  final String name;
  final String introduction;
  final String birthYear;
  final String imageUrl;
  final int shelterId;

  AnimalResponse(
    this.id,
    this.name,
    this.introduction,
    this.birthYear,
    this.imageUrl,
    this.shelterId,
  );

  factory AnimalResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimalResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AnimalResponseToJson(this);

  Animal toAnimal() =>
      Animal(id, shelterId, name, introduction, birthYear, imageUrl);
}

class AnimalResponseListTypeConverter
    extends JsonConverter<List<AnimalResponse>, String> {
  @override
  List<AnimalResponse> fromJson(String json) {
    var jsonObject = jsonDecode(json);
    return (jsonObject as List).map((e) => AnimalResponse.fromJson(e)).toList();
  }

  @override
  String toJson(List<AnimalResponse> object) {
    return jsonEncode(object.map((e) => e.toJson()).toList());
  }
}
