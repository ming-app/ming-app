import 'package:ming_api/ming_api.dart';

class SheltersInfo {
  final String regionName;
  final int numberOfShelters;
  final int numberOfProtectingPets;
  final int numberOfAdoptedPets;
  final int numberOfVolunteers;
  final List<Shelter> shelters;

  SheltersInfo(
    this.regionName,
    this.numberOfShelters,
    this.numberOfProtectingPets,
    this.numberOfAdoptedPets,
    this.numberOfVolunteers,
    this.shelters,
  );
}
