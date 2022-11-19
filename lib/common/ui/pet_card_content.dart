import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/ming_card_form.dart';
import 'package:ming/pets/model/pet_overview_info.dart';
import 'package:ming_api/entities/animal.dart';

import '../../generated/l10n.dart';
import '../routes.dart';

class PetCardContent extends StatelessWidget {
  final PetOverviewInfo pet;
  const PetCardContent(
    this.pet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;
    return MingImageCard(
      onTap: () {
        context.push(MingRoutingAddress.pets.address + "/${pet.id}");
      },
      image: NetworkImage(pet.imageUrl),
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
                pet.gender == AnimalGender.female
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
                pet.introduction,
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
