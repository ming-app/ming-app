part of 'shelters_bloc.dart';

@immutable
abstract class SheltersState {}

class SheltersUninitialized extends SheltersState {}

class SheltersError extends SheltersState {
  final String message;

  SheltersError(this.message);
}

class SheltersOnLoading extends SheltersState {}

class SheltersLoaded extends SheltersState {
  final SheltersInfo shelters;
  // todo: infinite scrolling implementation
  // check: https://medium.com/flutter-community/flutter-infinite-list-tutorial-with-flutter-bloc-2fc7a272ec67
  final bool reachMax;

  SheltersLoaded(this.shelters, this.reachMax);

  SheltersLoaded copyWith({
    SheltersInfo? shelters,
    bool? reachMax,
  }) {
    return SheltersLoaded(
      shelters ?? this.shelters,
      reachMax ?? this.reachMax,
    );
  }
}
