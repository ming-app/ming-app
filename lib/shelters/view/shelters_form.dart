import 'package:flutter/material.dart';
import '../../shelter_profile/shelter_profile.dart';
import '../model/shelters_info.dart';

import '../../common/ui/shelter_card_content.dart';

class SheltersForm extends StatelessWidget {
  final SheltersInfo info;

  const SheltersForm(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            info.regionName,
            style: Theme.of(context).textTheme.headline5,
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
