import 'dart:convert';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shelter.g.dart';

@CopyWith()
@JsonSerializable()
class Shelter {
  final int id;
  final String name;
  final String? introduction;
  final String? phoneNumber;
  final String? snsUrl;

  Shelter({
    required this.id,
    required this.name,
    this.introduction,
    this.phoneNumber,
    this.snsUrl,
  });

  factory Shelter.fromJson(Map<String, dynamic> json) =>
      _$ShelterFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterToJson(this);
}

@JsonSerializable()
class ShelterRegisterRequest {
  final String name;

  ShelterRegisterRequest(this.name);

  factory ShelterRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$ShelterRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterRegisterRequestToJson(this);
}

@JsonSerializable()
class ShelterUpdateRequest {
  final int shelterId;
  final String? introduction;
  final String? phoneNumber;
  final String? snsUrl;

  ShelterUpdateRequest(
    this.shelterId, {
    this.introduction,
    this.phoneNumber,
    this.snsUrl,
  });

  factory ShelterUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$ShelterUpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterUpdateRequestToJson(this);

  factory ShelterUpdateRequest.fromShelter(Shelter shelter) =>
      ShelterUpdateRequest(
        shelter.id,
        introduction: shelter.introduction,
        phoneNumber: shelter.phoneNumber,
        snsUrl: shelter.snsUrl,
      );
}

@JsonSerializable()
class ShelterResponse {
  final int id;
  final String name;
  final String? introduction;
  final String? phoneNumber;
  final String? snsUrl;

  ShelterResponse(
      {required this.id,
      this.introduction,
      required this.name,
      this.phoneNumber,
      this.snsUrl});

  factory ShelterResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterResponseToJson(this);

  Shelter toShelter() => Shelter(
        id: id,
        name: name,
        introduction: introduction,
        phoneNumber: phoneNumber,
        snsUrl: snsUrl,
      );
}

class ShelterResponseListTypeConverter
    extends JsonConverter<List<ShelterResponse>, String> {
  @override
  List<ShelterResponse> fromJson(String json) {
    var jsonObject = jsonDecode(json);
    return (jsonObject as List)
        .map((e) => ShelterResponse.fromJson(e))
        .toList();
  }

  @override
  String toJson(List<ShelterResponse> object) {
    return jsonEncode(object.map((e) => e.toJson()).toList());
  }
}

@JsonSerializable()
class RegisterUserToShelterRequest {
  final int shelterId;
  final String userEmail;

  RegisterUserToShelterRequest(this.shelterId, this.userEmail);
  factory RegisterUserToShelterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterUserToShelterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserToShelterRequestToJson(this);
}
