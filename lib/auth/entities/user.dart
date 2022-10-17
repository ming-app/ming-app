import 'package:ming_api/ming_api.dart';

class UserInfo {
  final String id;
  final String name;
  final String imageUrl;
  final String email;
  final bool isOfferedIdentification;
  final String? phoneNumber;
  final String? snsUrl;
  final String? introduction;
  final String? birthday;
  final String? address;
  final UserGender? gender;

  UserInfo(
    this.id,
    this.name,
    this.imageUrl,
    this.email,
    this.isOfferedIdentification, {
    this.phoneNumber,
    this.snsUrl,
    this.introduction,
    this.birthday,
    this.address,
    this.gender,
  });

  factory UserInfo.fromUserDetailInfoResponse(UserDetailInfoResponse response) {
    return UserInfo(
      response.id,
      response.name,
      response.image.url,
      response.email,
      response.isOfferedIdentification,
      phoneNumber: response.phoneNumber,
      snsUrl: response.snsUrl,
      introduction: response.introduction,
      birthday: response.birthday,
      address: response.address,
      gender: response.gender,
    );
  }
}
