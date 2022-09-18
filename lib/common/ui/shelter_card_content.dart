import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/shelter_profile/model/shelter_profile.dart';

import '../../generated/l10n.dart';
import '../routes.dart';

class ShelterCardContent extends StatefulWidget {
  const ShelterCardContent(this.shelter, {Key? key}) : super(key: key);

  final ShelterProfile shelter;

  @override
  State<ShelterCardContent> createState() => _ShelterCardContentState();
}

class _ShelterCardContentState extends State<ShelterCardContent> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return MingCard(
      onTap: () {
        context.go(
          MingRoutingAddress.shelters.address + "/${widget.shelter.id}",
        );
      },
      image: NetworkImage(widget.shelter.imageUrl),
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
              // todo: fill this with actual region
              Text(
                "서울특별시 강남구",
                style: theme.textTheme.labelSmall,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.shelter.name,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                "유기견 "
                        "${widget.shelter.numberOfDogs}" +
                    S.of(context).unitStringOfPet +
                    " · " "유기묘" "${widget.shelter.numberOfCats}" +
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
