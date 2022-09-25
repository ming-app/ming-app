import 'package:flutter/material.dart';

class ThumbnailImage extends StatelessWidget {
  final Image image;
  final Size size;

  const ThumbnailImage(this.image, {Key? key, this.size = const Size(30, 30)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: image.image,
          ),
        ));
  }
}
