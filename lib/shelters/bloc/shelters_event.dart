part of 'shelters_bloc.dart';

@immutable
abstract class SheltersEvent {}

class SheltersFetch extends SheltersEvent {
  final String? regionId;

  SheltersFetch({this.regionId});
}
