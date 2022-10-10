import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:ming_api/ming_api.dart';

@CopyWith()
class PetProfile {
  final String id;
  final String? imageUrl;
  final String name;
  final bool isFemale;
  final bool isDog;
  final int age;
  final String desc;
  final int numberOfVolunteer;
  final String birth;
  final String breed;
  final double weight;
  final bool isNeutralized;
  final String registeredAt;
  final String foundAt;
  final String managingRegion;
  final String shelterId;

  PetProfile({
    required this.id,
    required this.name,
    required this.isFemale,
    required this.isDog,
    required this.age,
    required this.desc,
    required this.numberOfVolunteer,
    required this.birth,
    required this.breed,
    required this.isNeutralized,
    required this.weight,
    required this.foundAt,
    required this.managingRegion,
    required this.registeredAt,
    required this.shelterId,
    this.imageUrl,
  });

  factory PetProfile.fromAnimalDetailResponse(AnimalDetailResponse response) {
    return PetProfile(
      id: response.id,
      name: response.name,
      isFemale: response.gender == AnimalGender.female,
      isDog: response.type == AnimalType.dog,
      // todo: check actual age
      age: DateTime.now().year - DateTime.parse(response.birthDay).year,
      desc: response.introduction,
      numberOfVolunteer: response.volunteerOverview.count,
      birth: response.birthDay,
      breed: response.kind,
      isNeutralized: response.neutering,
      weight: response.weightKg.toDouble(),
      foundAt: response.foundLocation,
      managingRegion: response.relatedAgency,
      registeredAt: response.takeOverDate,
      shelterId: response.shelter.id,
    );
  }
}
