import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/album/bloc/album_bloc.dart';
import 'package:ming/album/view/photo_preview.dart';
import 'package:ming/common/constants.dart';
import 'package:ming/common/ui/error_page.dart';

class AlbumView extends StatelessWidget {
  final String? shelterId;
  final String? animalId;

  const AlbumView({Key? key, this.shelterId, this.animalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(builder: ((context, state) {
      if (state is AlbumUninitialized) {
        context.read<AlbumBloc>().add(FetchImages());
        return spinLoader;
      } else if (state is AlbumError) {
        return const ErrorPage(
          message: "Album fetch failed",
        );
      }

      return PhotoPreview((state as ImageLoaded).images);
    }));
  }
}
