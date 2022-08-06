import 'package:flutter/material.dart';
import '../../shelter_profile/shelter_profile.dart';
import '../model/shelters_info.dart';

import '../../common/ui/shelter_card_content.dart';
import '../../common/ui/shelter_statistics_card.dart';

class SheltersForm extends StatelessWidget {
  final SheltersInfo info;

  const SheltersForm(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            info.regionName,
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: SheltersStatisticsInformation(
            info.numberOfProtectingPets,
            info.numberOfAdoptedPets,
            info.numberOfVolunteers,
            numberOfShelters: info.numberOfShelters,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: SheltersListView(info.shelters),
          ),
        ),
      ],
    );
  }
}

// todo: make this widget as infinete scrolling
class SheltersListView extends StatelessWidget {
  final List<ShelterProfile> shelters;

  const SheltersListView(this.shelters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shelters.map((e) => ShelterCardContent(e)).toList(),
    );
  }
}
