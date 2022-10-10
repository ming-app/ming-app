part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class FetchImages extends AlbumEvent {
  final ImageType type;
  final String id;
  final bool initialize;

  FetchImages(
    this.type,
    this.id, {
    this.initialize = false,
  });
}

class FetchAnimalImages extends AlbumEvent {
  final String animalId;

  FetchAnimalImages(this.animalId);
}
