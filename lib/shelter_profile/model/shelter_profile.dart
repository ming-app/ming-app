import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class ShelterProfile {
  final String name;
  final int numberOfCats;
  final int numberOfDogs;
  final int numberOfVolunteers;
  final double averageRate;
  final int reviewCount;
  final String region;
  final ShelterManagerProfile manager;
  final String desc;

  ShelterProfile({
    required this.name,
    this.numberOfCats = 0,
    this.numberOfDogs = 0,
    this.numberOfVolunteers = 0,
    required this.averageRate,
    required this.reviewCount,
    required this.region,
    required this.manager,
    required this.desc,
  });
}

@CopyWith()
class ShelterManagerProfile {
  final String name;
  final String? phoneNumber;
  final String? imageUrl;

  ShelterManagerProfile({
    required this.name,
    this.phoneNumber,
    this.imageUrl,
  });
}
