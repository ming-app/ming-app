import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'thumbnail.dart';
import 'package:ming_api/ming_api.dart';

import '../../generated/l10n.dart';
import '../../home/mock/mock.dart';
import '../routes.dart';

class ShelterCardContent extends StatelessWidget {
  const ShelterCardContent(this.shelter, {Key? key}) : super(key: key);

  final Shelter shelter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return InkWell(
      onTap: () {
        context.go(MingRoutingAddress.shelters.address + "/id");
      },
      child: SizedBox(
        width: 230,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                child: Stack(
                  children: [
                    if (shelter.imageUrl != null)
                      Positioned.fill(
                        child: Ink.image(
                          image: NetworkImage(shelter.imageUrl!),
                          fit: BoxFit.cover,
                          child: Container(),
                        ),
                      ),
                  ],
                ),
              ),
              // Description and share/explore buttons.
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: DefaultTextStyle(
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: descriptionStyle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // todo: fill this with actual region
                      Text(
                        "서울특별시 강남구",
                        style: theme.textTheme.caption,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        shelter.name,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        "유기견 "
                                "${shelter.numberOfDogs}" +
                            S.of(context).unitStringOfPet +
                            " · " "유기묘" "${shelter.numberOfCats}" +
                            S.of(context).unitStringOfPet,
                        style: theme.textTheme.caption,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // todo: fill this with actual users photo
                      Row(
                        children: userThumbnails
                            .map((e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: ThumbnailImage(e),
                                ))
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${shelter.numberOfVolunteers}명의 봉사자가 활동하고 있어요.",
                        style: theme.textTheme.caption,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
