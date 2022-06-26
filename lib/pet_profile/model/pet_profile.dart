import 'package:copy_with_extension/copy_with_extension.dart';

@CopyWith()
class PetProfile {
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
}
