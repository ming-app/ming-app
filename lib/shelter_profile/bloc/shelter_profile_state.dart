part of 'shelter_profile_bloc.dart';

@immutable
abstract class ShelterProfileState {}

class ShelterProfileInitial extends ShelterProfileState {}

class ShelterProfileOnLoading extends ShelterProfileState {}

class ShelterProfileFetched extends ShelterProfileState {
  final ShelterProfile profile;

  ShelterProfileFetched(this.profile);
}

class ShelterProfileError extends ShelterProfileState {}
