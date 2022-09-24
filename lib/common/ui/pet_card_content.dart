import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/pet_profile/model/pet_profile.dart';

import '../../generated/l10n.dart';
import '../routes.dart';

class PetCardContent extends StatelessWidget {
  final PetProfile pet;
  const PetCardContent(
    this.pet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;
    return MingCard(
      onTap: () {
        context.go(MingRoutingAddress.pets.address + "/${pet.id}");
      },
      image: pet.imageUrl != null ? NetworkImage(pet.imageUrl!) : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pet.name,
                style: theme.textTheme.titleMedium,
              ),
              Text(
                pet.isFemale
                    ? S.of(context).femaleString +
                        " · " +
                        "${pet.age}" +
                        S.of(context).ageString
                    : S.of(context).maleString +
                        " · " +
                        "${pet.age}" +
                        S.of(context).ageString,
                style: theme.textTheme.bodySmall,
                softWrap: true,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                pet.desc,
                style: theme.textTheme.labelSmall,
                softWrap: true,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
