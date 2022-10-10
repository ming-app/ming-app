import 'package:ming_api/ming_api.dart';

class ShelterOverviewInfo {
  final String id;
  final String name;
  final String region;
  final int? numberOfCats;
  final int? numberOfDogs;
  final int numberOfVolunteers;
  final String imageUrl;
  final String phoneNumber;

  ShelterOverviewInfo({
    required this.id,
    required this.name,
    required this.region,
    this.numberOfCats,
    this.numberOfDogs,
    required this.numberOfVolunteers,
    required this.imageUrl,
    required this.phoneNumber,
  });

  factory ShelterOverviewInfo.fromShelterInfoResponse(
      ShelterInfoResponse response) {
    return ShelterOverviewInfo(
      id: response.id,
      name: response.name,
      region: response.location,
      numberOfCats: response.animalOverview
          .firstWhere((element) => element.type == AnimalType.cat)
          .count,
      numberOfDogs: response.animalOverview
          .firstWhere((element) => element.type == AnimalType.dog)
          .count,
      numberOfVolunteers: response.volunteerOverview.count,
      imageUrl: response.image.url,
      phoneNumber: response.phoneNumber,
    );
  }
}
