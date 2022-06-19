import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';
import '../../home/mock/mock.dart';
import '../routes.dart';
import 'thumbnail.dart';

class PetCardContent extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final bool isFemale;
  final int age;
  final String desc;
  final int numberOfVolunteer;

  // todo: volunteer thumnail handling.
  const PetCardContent({
    this.imageUrl,
    required this.name,
    required this.isFemale,
    required this.age,
    required this.desc,
    required this.numberOfVolunteer,
    Key? key,
  }) : super(key: key);

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
                    if (imageUrl != null)
                      Positioned.fill(
                        child: Ink.image(
                          image: NetworkImage(imageUrl!),
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
                        name,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        isFemale
                            ? S.of(context).femaleString
                            : S.of(context).maleString +
                                " · " +
                                "$age" +
                                S.of(context).ageString,
                        style: theme.textTheme.caption,
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        desc,
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
                        "$numberOfVolunteer명의 봉사자가 활동하고 있어요.",
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
