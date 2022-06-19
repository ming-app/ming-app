import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class PhotoListView extends StatelessWidget {
  final List<String> photos;

  const PhotoListView(this.photos, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 230,
        child: Stack(
          children: [
            Positioned.fill(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: photos
                    .map(
                      (e) => Image.network(e),
                    )
                    .toList(),
              ),
            ),
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
