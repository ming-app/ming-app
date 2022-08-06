part of 'shelters_bloc.dart';

@immutable
abstract class SheltersState {}

class SheltersUninitialized extends SheltersState {}

class SheltersError extends SheltersState {
  final String message;

  SheltersError(this.message);
}

class SheltersLoaded extends SheltersState {
  final List<ShelterProfile> shelters;
  final bool onlyAuthenticated;
  // todo: infinite scrolling implementation
  // check: https://medium.com/flutter-community/flutter-infinite-list-tutorial-with-flutter-bloc-2fc7a272ec67
  final bool reachMax;

  SheltersLoaded(this.shelters, this.onlyAuthenticated, this.reachMax);

  SheltersLoaded copyWith({
    List<ShelterProfile>? shelters,
    bool? onlyAuthenticated,
    bool? reachMax,
  }) {
    return SheltersLoaded(
      shelters ?? this.shelters,
      onlyAuthenticated ?? this.onlyAuthenticated,
      reachMax ?? this.reachMax,
    );
  }
}
