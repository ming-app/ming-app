import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';
import 'package:ming/album/mock/album_mock.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  // todo: get repository and use it to fetch rather than mock.

  AlbumBloc() : super(AlbumUninitialized()) {
    on<AlbumEvent>((event, emit) {
      if (event is FetchImages) {
        onFetchImages(event, emit);
      }
    });
  }

  void onFetchImages(AlbumEvent event, Emitter<AlbumState> emit) async {
    var idx = 0;

    if (state is ImageLoaded) {
      if ((state as ImageLoaded).maxReached) {
        return;
      }
      idx = (state as ImageLoaded).images.length;
    }

    // todo: change mockFEtchImages into real image fetching.
    var images = mockFetchImages(idx)
        .map((e) {
          try {
            return Image.network(e);
          } catch (e) {
            Log.e("Image creation from network error", e);
            return null;
          }
        })
        .whereType<Image>()
        .toList();

    if (state is! ImageLoaded) {
      emit(ImageLoaded(images, false));
      return;
    }

    emit(images.isEmpty
        ? (state as ImageLoaded).copyWith(maxReached: true)
        : ImageLoaded((state as ImageLoaded).images + images, false));
  }
}
