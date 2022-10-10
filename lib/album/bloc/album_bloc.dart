import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';
import 'package:ming_api/entities/image.dart';
import 'package:ming_api/ming_api.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final MingApiRepository _api;

  // todo: get repository and use it to fetch rather than mock.

  AlbumBloc(this._api) : super(AlbumUninitialized()) {
    on<AlbumEvent>((event, emit) async {
      if (event is FetchImages) {
        await onFetchImages(event, emit);
      }
    });
  }

  Future<void> onFetchImages(
      FetchImages event, Emitter<AlbumState> emit) async {
    var idx = 0;

    if (state is ImageLoaded) {
      idx = (state as ImageLoaded).images.length;
    }

    List<String> imageList;

    try {
      emit(ImageOnLoading());
      var result = await _api.client.getImages(
        type: event.type.value,
        id: event.id,
      );
      idx = result.result?.number ?? 0;
      imageList = result.result?.content.map((e) => e.url).toList() ?? [];
    } catch (e) {
      Log.e("Error on fetching image list from api.", e);
      emit(AlbumError());
      return;
    }

    var images = imageList
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

    if (state is! ImageLoaded || event.initialize) {
      emit(ImageLoaded(event.id, event.type, images, false));
      return;
    }

    emit(images.isEmpty
        ? (state as ImageLoaded).copyWith(maxReached: true)
        : ImageLoaded(event.id, event.type,
            (state as ImageLoaded).images + images, false));
  }
}
