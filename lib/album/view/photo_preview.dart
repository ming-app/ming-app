import 'package:flutter/material.dart';
import 'package:ming/common/adaptive_builder.dart';
import 'package:ming/common/ming_icons.dart';

import '../../generated/l10n.dart';

class PhotoPreview extends StatelessWidget {
  final List<Image> photos;

  const PhotoPreview(this.photos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      mobile: PhotoMobilePreview(
        photos: photos,
      ),
      desktop: PhotoDesktopPreview(photos: photos),
    );
  }
}

class PhotoMobilePreview extends StatelessWidget {
  const PhotoMobilePreview({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<Image> photos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 281,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        child: photos.first,
      ),
    );
  }
}

class PhotoDesktopPreview extends StatelessWidget {
  const PhotoDesktopPreview({
    Key? key,
    required this.photos,
  }) : super(key: key);

  final List<Image> photos;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 400,
        constraints: BoxConstraints(maxWidth: 1200),
        child: Stack(
          children: [
            Positioned.fill(
              child: PhotoPreviewForm(photos),
            ),
            if (photos.length >= 6)
              Positioned(
                right: 25,
                bottom: 25,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    width: 167,
                    height: 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(MingIcons.menu),
                        Text(S.of(context).showAllPhotos),
                      ],
                    ),
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
  final double margin = 8;
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
                .map(
                  (e) => Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: photos.last == e ? 0 : margin),
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.cover,
                          clipBehavior: Clip.hardEdge,
                          child: e,
                        ),
                      ),
                    ),
                  ),
                )
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
                      .map(
                        (e) => Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: e == photos.first ? margin : 0),
                            child: SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                clipBehavior: Clip.hardEdge,
                                child: e,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: margin,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: photos
                      .sublist(2, 4)
                      .map(
                        (e) => Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: e == photos.last ? 0 : margin),
                            child: SizedBox.expand(
                              child: FittedBox(
                                fit: BoxFit.cover,
                                clipBehavior: Clip.hardEdge,
                                child: e,
                              ),
                            ),
                          ),
                        ),
                      )
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
              SizedBox(
                width: margin,
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
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: e == photos[1] ? margin : 0),
                                    child: SizedBox.expand(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        clipBehavior: Clip.hardEdge,
                                        child: e,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    Expanded(
                      flex: 1,
                      child: Row(
                        children: photos
                            .sublist(3, 5)
                            .map((e) => Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: e == photos[3] ? margin : 0),
                                    child: SizedBox.expand(
                                      child: FittedBox(
                                        fit: BoxFit.cover,
                                        clipBehavior: Clip.hardEdge,
                                        child: e,
                                      ),
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
