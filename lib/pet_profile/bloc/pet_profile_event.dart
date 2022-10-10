part of 'pet_profile_bloc.dart';

@immutable
abstract class PetProfileEvent {}

class PetProfileFetch extends PetProfileEvent {
  final String petId;

  PetProfileFetch(this.petId);
}
