import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'shelter.g.dart';

@JsonSerializable()
class ShelterRegisterRequest {
  final String name;
  final String shelterAdminUid;

  ShelterRegisterRequest(this.name, this.shelterAdminUid);

  factory ShelterRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$ShelterRegisterRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterRegisterRequestToJson(this);
}

@JsonSerializable()
class ShelterResponse {
  final int id;
  final String introduction;
  final String name;
  final String phoneNumber;
  final String snsUrl;

  ShelterResponse(
      this.id, this.introduction, this.name, this.phoneNumber, this.snsUrl);

  factory ShelterResponse.fromJson(Map<String, dynamic> json) =>
      _$ShelterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ShelterResponseToJson(this);
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

// todo: implement this after api changed into email-based
@JsonSerializable()
class RegisterUserToShelterRequest {}
