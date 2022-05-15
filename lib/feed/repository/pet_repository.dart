import 'fake_pet_repository.dart';

import '../models/pet.dart';

abstract class PetRepository {
  // todo: infinite scrolling requires paginations of this function.
  Future<List<Pet>> fetchPetList();
}

PetRepository get petRepository => FakePetRepository();
