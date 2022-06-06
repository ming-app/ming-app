import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final Image image;

  const ThumbnailImage(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image.image,
          ),
        ));
  }
}
