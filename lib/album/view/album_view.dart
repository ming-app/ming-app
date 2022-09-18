import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/album/bloc/album_bloc.dart';
import 'package:ming/album/view/photo_preview.dart';
import 'package:ming/common/constants.dart';
import 'package:ming/common/ui/error_page.dart';

class AlbumView extends StatelessWidget {
  final String id;
  final bool isShelterId;

  const AlbumView(this.id, this.isShelterId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void fetchImages() {
      context
          .read<AlbumBloc>()
          .add(isShelterId ? FetchShelterImages(id) : FetchAnimalImages(id));
    }

    return BlocBuilder<AlbumBloc, AlbumState>(builder: ((context, state) {
      if (state is AlbumUninitialized) {
        fetchImages();
        return spinLoader;
      } else if (state is ImageLoaded) {
        if (state.id != id || state.isShelter != isShelterId) {
          fetchImages();
          return spinLoader;
        }
      } else if (state is AlbumError) {
        return const ErrorPage(
          message: "Album fetch failed",
        );
      }

      return PhotoPreview((state as ImageLoaded).images);
    }));
  }
}
