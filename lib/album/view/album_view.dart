import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/album/bloc/album_bloc.dart';
import 'package:ming/album/view/photo_preview.dart';
import 'package:ming/common/constants.dart';
import 'package:ming/common/ui/error_page.dart';
import 'package:ming_api/entities/image.dart';

class AlbumView extends StatelessWidget {
  final String id;
  final ImageType type;

  const AlbumView(this.id, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void fetchImages() {
      context.read<AlbumBloc>().add(FetchImages(type, id));
    }

    return BlocBuilder<AlbumBloc, AlbumState>(builder: ((context, state) {
      if (state is AlbumUninitialized) {
        fetchImages();
        return spinLoader;
      } else if (state is ImageOnLoading) {
        return spinLoader;
      } else if (state is ImageLoaded) {
        if (state.id != id || state.type != type) {
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
