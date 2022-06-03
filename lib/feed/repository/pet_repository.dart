import '../models/pet.dart';
import 'fake_pet_repository.dart';

abstract class PetRepository {
  // todo: infinite scrolling requires paginations of this function.
  Future<List<Pet>> fetchPetList();
}

PetRepository get petRepository => FakePetRepository();
