part of 'pet_profile_bloc.dart';

@immutable
abstract class PetProfileState {}

class PetProfileInitial extends PetProfileState {}

class PetProfileOnLoading extends PetProfileState {}

class PetProfileFetched extends PetProfileState {
  final PetProfile profile;
  final ShelterOverviewInfo shelter;

  PetProfileFetched(this.profile, this.shelter);
}

class PetProfileError extends PetProfileState {}
