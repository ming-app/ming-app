import 'package:ming/shelters/model/shelter_overview_info.dart';
import 'package:ming_api/ming_api.dart';

class SheltersInfo {
  final String regionName;
  final int numberOfShelters;
  final int numberOfProtectingPets;
  final int numberOfAdoptedPets;
  final int numberOfVolunteers;
  final List<ShelterOverviewInfo> shelters;

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
    List<ShelterInfoResponse> shelterResponse,
  ) {
    return SheltersInfo(
      response.region.fullName,
      response.count,
      response.animalInShelterCount,
      response.adoptedAnimalCount,
      response.volunteerOverview.count,
      shelterResponse
          .map((e) => ShelterOverviewInfo.fromShelterInfoResponse(e))
          .toList(),
    );
  }

  factory SheltersInfo.fromOverallResponse(
    List<ShelterByRegionResponse> response,
    List<ShelterInfoResponse> shelterResponse,
  ) {
    return SheltersInfo(
      "전체",
      response.fold(0, (prev, element) => prev + element.count),
      response.fold(0, (prev, element) => prev + element.animalInShelterCount),
      response.fold(0, (prev, element) => prev + element.adoptedAnimalCount),
      response.fold(
          0, (prev, element) => prev + element.volunteerOverview.count),
      shelterResponse
          .map((e) => ShelterOverviewInfo.fromShelterInfoResponse(e))
          .toList(),
    );
  }

  factory SheltersInfo.empty() {
    return SheltersInfo("로딩중", 0, 0, 0, 0, []);
  }
}
