import 'package:ming_api/ming_api.dart';

import '../../shelter_profile/model/shelter_profile.dart';

class SheltersInfo {
  final String regionName;
  final int numberOfShelters;
  final int numberOfProtectingPets;
  final int numberOfAdoptedPets;
  final int numberOfVolunteers;
  final List<ShelterProfile> shelters;

  SheltersInfo(
    this.regionName,
    this.numberOfShelters,
    this.numberOfProtectingPets,
    this.numberOfAdoptedPets,
    this.numberOfVolunteers,
    this.shelters,
  );

  factory SheltersInfo.fromShelterByRegionRespnose(
      ShelterByRegionResponse response,
      List<ShelterOverviewResponse> shelterResponse) {
    return SheltersInfo(
      response.region.fullName,
      response.count,
      response.animalInShelterCount,
      response.adoptedAnimalCount,
      response.volunteerOverview.count,
      shelterResponse
          .map((e) => ShelterProfile.fromShelterOverviewResponse(e))
          .toList(),
    );
  }
}
