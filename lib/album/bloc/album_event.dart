part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class FetchShelterImages extends AlbumEvent {
  final String shelterId;

  FetchShelterImages(this.shelterId);
}

class FetchAnimalImages extends AlbumEvent {
  final String animalId;

  FetchAnimalImages(this.animalId);
}
