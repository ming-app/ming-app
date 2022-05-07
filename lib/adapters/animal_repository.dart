import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ming/entities/animal.dart';

import '../models/animal_repository.dart';

class AnimalRepositoryImpl extends AnimalRepository {
  // TODO : future로 넘겨줄 필요 있을지 확인
  @override
  Future<List<Animal>> getAnimals(String shelterId) async {
    // TODO : make common for this repo. instance di
    final ref = FirebaseFirestore.instance
        .collection("animals")
        .withConverter<Animal>(
            fromFirestore: (animals, _) => Animal.fromJson(animals.data()!),
            toFirestore: (animal, _) => animal.toJson());
    final result = await ref.where("shelter_id", isEqualTo: shelterId).get();
    return result.docs.map((e) => e.data()).toList();
  }

  @override
  void registerAnimal(Animal animal) {
    // TODO: implement registerAnimal
  }
}
