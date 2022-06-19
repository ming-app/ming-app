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

  PetProfile({
    required this.name,
    required this.isFemale,
    required this.isDog,
    required this.age,
    required this.desc,
    required this.numberOfVolunteer,
    this.imageUrl,
  });
}
