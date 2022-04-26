import '../entities/pet.dart';

abstract class PetRepository {
  // todo: infinite scrolling requires paginations of this function.
  Future<List<Pet>> fetchPetList();
}
