part of 'pets_bloc.dart';

@immutable
abstract class PetsState {}

class PetsInitial extends PetsState {}

class PetsListOnLoading extends PetsState {}

class PetsListFetchError extends PetsState {}

class PetsListFetched extends PetsState {
  final String shelterId;
  final int pageSize;
  final int pageNumber;
  final int totalPageNumaber;
  final List<PetOverviewInfo> pets;

  PetsListFetched({
    required this.shelterId,
    required this.pageSize,
    required this.pageNumber,
    required this.totalPageNumaber,
    required this.pets,
  });
}
