import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pet.dart';
import '../repository/pet_repository.dart';

// States
@immutable
abstract class PetFeedState {}

class PetFeedInitial extends PetFeedState {}

class PetFeedFetched extends PetFeedState {
  final List<Pet> pets;

  PetFeedFetched(this.pets);
}

// Events
@immutable
abstract class PetFeedEvent {}

class PetFeedFetch extends PetFeedEvent {}

// Bloc
class PetFeedBloc extends Bloc<PetFeedEvent, PetFeedState> {
  final PetRepository _petRepository;

  PetFeedBloc({required PetRepository petRepository})
      : _petRepository = petRepository,
        super(PetFeedInitial()) {
    on<PetFeedFetch>(_onPetFeedFetch);
  }

  void _onPetFeedFetch(PetFeedEvent event, Emitter<PetFeedState> emit) async {
    var pets = await _petRepository.fetchPetList();
    emit(PetFeedFetched(pets));
  }
}
