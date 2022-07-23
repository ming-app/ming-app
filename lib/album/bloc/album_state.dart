part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumUninitialized implements AlbumState {}

class AlbumError implements AlbumState {}

class ImageLoaded implements AlbumState {
  final List<Image> images;
  final bool maxReached;

  ImageLoaded(this.images, this.maxReached);

  ImageLoaded copyWith({
    List<Image>? images,
    bool? maxReached,
  }) {
    return ImageLoaded(
      images ?? this.images,
      maxReached ?? this.maxReached,
    );
  }
}
