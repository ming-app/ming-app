import 'package:flutter/material.dart';
import 'package:ming/common/adaptive_builder.dart';
import 'package:ming/shelters/model/shelter_overview_info.dart';
import '../model/shelters_info.dart';

import '../../common/ui/shelter_card_content.dart';

class SheltersForm extends StatelessWidget {
  final SheltersInfo info;

  const SheltersForm(this.info, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      mobile: SheltersMobileForm(info: info),
      desktop: SheltersDesktopForm(info: info),
    );
  }
}

class SheltersMobileForm extends StatelessWidget {
  const SheltersMobileForm({
    Key? key,
    required this.info,
  }) : super(key: key);

  final SheltersInfo info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
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
              child: Column(
                children: info.shelters
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: ShelterCardContent(
                            e,
                            isMobile: true,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SheltersDesktopForm extends StatelessWidget {
  const SheltersDesktopForm({
    Key? key,
    required this.info,
  }) : super(key: key);

  final SheltersInfo info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
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
      ),
    );
  }
}

// todo: make this widget as infinete scrolling
class SheltersListView extends StatelessWidget {
  final List<ShelterOverviewInfo> shelters;

  const SheltersListView(this.shelters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shelters.map((e) => ShelterCardContent(e)).toList(),
    );
  }
}
