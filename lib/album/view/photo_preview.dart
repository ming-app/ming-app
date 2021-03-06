import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class PhotoPreview extends StatelessWidget {
  final List<Image> photos;

  const PhotoPreview(this.photos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 230,
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoPreviewForm(photos),
            ),
            if (photos.length >= 6)
              Positioned(
                right: 25,
                bottom: 25,
                child: Card(
                  child: Row(
                    children: [
                      const Icon(Icons.menu),
                      Text(S.of(context).showAllPhotos),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class PhotoPreviewForm extends StatelessWidget {
  final List<Image> photos;

  const PhotoPreviewForm(this.photos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (photos.length) {
      case 0:
        return Container();

      case 1:
        {
          return FittedBox(
            fit: BoxFit.cover,
            child: photos[0],
          );
        }
      case 2:
      case 3:
        {
          return Row(
            children: photos
                .map((e) => Expanded(
                      flex: 1,
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          clipBehavior: Clip.hardEdge,
                          child: e,
                        ),
                      ),
                    ))
                .toList(),
          );
        }
      case 4:
        {
          return Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: photos
                      .sublist(0, 2)
                      .map((e) => Expanded(
                            flex: 1,
                            child: SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                clipBehavior: Clip.hardEdge,
                                child: e,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: photos
                      .sublist(2, 4)
                      .map((e) => Expanded(
                            flex: 1,
                            child: SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                clipBehavior: Clip.hardEdge,
                                child: e,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          );
        }
      default:
        {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.cover,
                    clipBehavior: Clip.hardEdge,
                    child: photos[0],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: photos
                            .sublist(1, 3)
                            .map((e) => Expanded(
                                  flex: 1,
                                  child: SizedBox.expand(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      clipBehavior: Clip.hardEdge,
                                      child: e,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: photos
                            .sublist(3, 5)
                            .map((e) => Expanded(
                                  flex: 1,
                                  child: SizedBox.expand(
                                    child: FittedBox(
                                      fit: BoxFit.cover,
                                      clipBehavior: Clip.hardEdge,
                                      child: e,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        }
    }
  }
}
