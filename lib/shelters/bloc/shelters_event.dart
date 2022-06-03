part of 'shelters_bloc.dart';

@immutable
abstract class SheltersEvent {}

class SheltersFetch extends SheltersEvent {
  final bool onlyAuthenticated;

  SheltersFetch({this.onlyAuthenticated = false});
}
