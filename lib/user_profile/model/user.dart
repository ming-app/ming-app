import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:ming_api/ming_api.dart';

part 'user.g.dart';

@CopyWith()
class UserProfile {
  final String name;
  final String thumbnailUrl;
  final String email;
  final String? phoneNumber;
  final String? snsUrl;
  final String? introduction;
  final String? birthday;
  final String? address;
  final UserGender? gender;

  UserProfile({
    required this.name,
    required this.thumbnailUrl,
    required this.email,
    this.phoneNumber,
    this.snsUrl,
    this.introduction,
    this.birthday,
    this.address,
    this.gender,
  });

  factory UserProfile.empty() {
    return UserProfile(name: "", thumbnailUrl: "", email: "");
  }

  factory UserProfile.fromUserDetailInfoResponse(
      UserDetailInfoResponse response) {
    return UserProfile(
      name: response.name,
      thumbnailUrl: response.thumbnailUrl,
      email: response.email,
      phoneNumber: response.phoneNumber,
      snsUrl: response.snsUrl,
      introduction: response.introduction,
      birthday: response.birthday,
      address: response.address,
      gender: response.gender,
    );
  }
}
