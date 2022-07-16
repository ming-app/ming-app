part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  abstract final List<RegionalInfo> regions;
}

class HomeInitial extends HomeState {
  @override
  List<RegionalInfo> get regions => [];
}

class HomeFetched extends HomeState {
  @override
  final List<RegionalInfo> regions;

  HomeFetched(this.regions);
}
