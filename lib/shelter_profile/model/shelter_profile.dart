import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:ming_api/ming_api.dart';

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
  final String thumbnailUrl;

  ShelterProfile({
    required this.name,
    this.numberOfCats = 0,
    this.numberOfDogs = 0,
    required this.numberOfVolunteers,
    this.averageRate = 5.0,
    this.reviewCount = 0,
    required this.region,
    required this.manager,
    required this.desc,
    required this.thumbnailUrl,
  });

  factory ShelterProfile.fromShelterOverviewResponse(
      ShelterOverviewResponse response) {
    return ShelterProfile(
      name: response.name,
      numberOfCats: response.animalOverview
          .firstWhere((element) => element.type == AnimalType.cat)
          .count,
      numberOfDogs: response.animalOverview
          .firstWhere((element) => element.type == AnimalType.dog)
          .count,
      numberOfVolunteers: response.volunteerOverview.count,
      averageRate: 5.0,
      reviewCount: 30,
      region: response.location,
      manager: ShelterManagerProfile(
        name: response.adminName,
        phoneNumber: response.phoneNumber,
      ),
      desc: response.description,
      thumbnailUrl: response.thumbnailUrl,
    );
  }
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
