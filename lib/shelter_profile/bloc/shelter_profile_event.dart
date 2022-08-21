part of 'shelter_profile_bloc.dart';

@immutable
abstract class ShelterProfileEvent {}

class ShelterProfileFetch extends ShelterProfileEvent {
  final String shelterId;

  ShelterProfileFetch(this.shelterId);
}
