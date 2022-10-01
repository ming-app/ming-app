part of 'pets_bloc.dart';

@immutable
abstract class PetsEvent {}

class FetchPetsList extends PetsEvent {
  final int pageSize = 8;
  final String shelterId;
  final int pageNumber;

  FetchPetsList(
    this.shelterId, {
    this.pageNumber = 0,
  });
}
