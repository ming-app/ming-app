import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/thumbnail.dart';
import 'package:ming/home/model/regional_info.dart';

import '../../common/routes.dart';
import '../../generated/l10n.dart';

class ShetlerRegionInfoForm extends StatelessWidget {
  final List<RegionalInfo> regions;

  const ShetlerRegionInfoForm(this.regions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 6, 40, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text.rich(
              TextSpan(
                text: S.of(context).regionString,
              ),
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: regions.map((e) => ShelterRegionCard(e)).toList(),
          ),
        ],
      ),
    );
  }
}

class ShelterRegionCard extends StatelessWidget {
  final RegionalInfo region;

  const ShelterRegionCard(this.region, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('${MingRoutingAddress.shelters}?region=${region.slug}');
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            height: 130,
            width: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  region.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${region.shelterCount}개 보호소',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: region.userImages
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 2,
                            ),
                            child: ThumbnailImage(e),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '${region.volunteerCount}명의 봉사자가 홛동하고 있어요.',
                  style: Theme.of(context).textTheme.caption,
                  textScaleFactor: 0.8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
