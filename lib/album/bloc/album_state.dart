part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumUninitialized implements AlbumState {}

class ImageOnLoading implements AlbumState {}

class AlbumError implements AlbumState {}

class ImageLoaded implements AlbumState {
  final String id;
  final ImageType type;
  final List<Image> images;
  final bool maxReached;

  ImageLoaded(this.id, this.type, this.images, this.maxReached);

  ImageLoaded copyWith({
    String? id,
    ImageType? type,
    List<Image>? images,
    bool? maxReached,
  }) {
    return ImageLoaded(
      id ?? this.id,
      type ?? this.type,
      images ?? this.images,
      maxReached ?? this.maxReached,
    );
  }
}
