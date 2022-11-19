import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/shelters/model/shelter_overview_info.dart';

import '../../generated/l10n.dart';
import '../routes.dart';

class ShelterCardContent extends StatelessWidget {
  const ShelterCardContent(
    this.shelter, {
    this.isMobile = false,
    Key? key,
  }) : super(key: key);

  final ShelterOverviewInfo shelter;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return MingImageCard(
      isMobile: isMobile,
      onTap: () {
        context.go(
          MingRoutingAddress.shelters.address + "/${shelter.id}",
        );
      },
      image: NetworkImage(shelter.imageUrl),
      child: // Description and share/explore buttons.
          Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shelter.region,
                style: theme.textTheme.labelSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                shelter.name,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                "유기견 "
                        "${shelter.numberOfDogs}" +
                    S.of(context).unitStringOfPet +
                    " · " "유기묘" "${shelter.numberOfCats}" +
                    S.of(context).unitStringOfPet,
                style: theme.textTheme.bodySmall,
                softWrap: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
