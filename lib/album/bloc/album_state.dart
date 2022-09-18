part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumUninitialized implements AlbumState {}

class AlbumError implements AlbumState {}

class ImageLoaded implements AlbumState {
  final String id;
  final bool isShelter;
  final List<Image> images;
  final bool maxReached;

  ImageLoaded(this.id, this.isShelter, this.images, this.maxReached);

  ImageLoaded copyWith({
    String? id,
    bool? isShelter,
    List<Image>? images,
    bool? maxReached,
  }) {
    return ImageLoaded(
      id ?? this.id,
      isShelter ?? this.isShelter,
      images ?? this.images,
      maxReached ?? this.maxReached,
    );
  }
}
