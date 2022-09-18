import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ming/album/view/album_view.dart';
import 'package:ming/album/view/photo_preview.dart';
import 'package:ming/common/ui/shelter_card_content.dart';
import 'package:ming/pet_profile/model/pet_profile.dart';
import 'package:ming/shelter_profile/shelter_profile.dart';
import 'package:ming/shelters/mock/shelters_mock.dart';
import 'package:ming_api/ming_api.dart';
import 'package:tuple/tuple.dart';

import '../../common/ui/thumbnail.dart';
import '../../generated/l10n.dart';
import '../../home/mock/mock.dart';

class PetProfileForm extends StatelessWidget {
  final PetProfile pet;
  const PetProfileForm(this.pet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlbumView(pet.id, false),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PetDescription(pet),
                        _shelterProfileCard(context, mockShelters.first),
                      ],
                    ),
                    flex: 2,
                  ),
                  const Expanded(
                    child: AdoptRequestCard(),
                    flex: 1,
                  ),
                ],
              ),
            ),
            const Divider(),
            // todo: 보호일지 view
            _journalListView(context),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _journalListView(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "보호 일지",
            style: theme.textTheme.titleMedium,
          ),
          Text(
            "WiP",
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }

  Widget _shelterProfileCard(BuildContext context, ShelterProfile shelter) {
    final theme = Theme.of(context);
    final strings = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "보호소",
            style: theme.textTheme.titleMedium,
          ),
          ShelterCardContent(shelter),
        ],
      ),
    );
  }
}

class PetDescription extends StatelessWidget {
  final PetProfile pet;
  const PetDescription(this.pet, {Key? key}) : super(key: key);

  DateTime get registeredDate => DateTime.parse(pet.registeredAt);
  int get _protectedDate => DateTime.now().difference(registeredDate).inDays;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          pet.name,
          style: theme.textTheme.titleMedium,
        ),
        Row(
          children: [
            Text(
              // todo: fill this with actual value
              "보호 일지 20개",
              style: theme.textTheme.caption,
            ),
            const Spacer(),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                size: 15,
              ),
              label: Text(
                strings.share,
              ),
            ),
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
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
              Text(
                "${pet.numberOfVolunteer}" +
                    strings.volunteerNumberSentenceString,
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              const Icon(Icons.calendar_today_outlined),
              const SizedBox(
                width: 10,
              ),
              Text("보호 $_protectedDate일째"),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 20,
            runSpacing: 20,
            children: [
              Tuple2<IconData, String>(
                Icons.calendar_today_outlined,
                pet.isDog ? strings.dog : strings.cat,
              ),
              Tuple2<IconData, String>(
                Icons.home_outlined,
                pet.breed,
              ),
              Tuple2<IconData, String>(
                Icons.calendar_today_outlined,
                pet.isFemale ? strings.femaleString : strings.maleString,
              ),
              Tuple2<IconData, String>(
                Icons.calendar_today_outlined,
                pet.isNeutralized ? "중성화 수술 함" : "중성화 수술 안함",
              ),
              Tuple2<IconData, String>(
                Icons.monitor_weight,
                "${pet.weight}kg",
              ),
              Tuple2<IconData, String>(
                Icons.baby_changing_station,
                pet.birth,
              ),
            ]
                .map(
                  (e) => SizedBox(
                    width: 170,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(e.item1),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e.item2,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const Divider(),
        Column(
          children: [
            Tuple3<IconData, String, String>(
                Icons.abc_outlined, pet.registeredAt, "접수 일시"),
            Tuple3<IconData, String, String>(
                Icons.abc_outlined, pet.foundAt, "발생 장소"),
            Tuple3<IconData, String, String>(
                Icons.abc_outlined, pet.managingRegion, "관할 지역"),
          ].map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(e.item1),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.item2),
                      Text(
                        e.item3,
                        style: theme.textTheme.caption,
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const Divider(),
        ExpandableNotifier(
          child: Expandable(
            collapsed: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    pet.desc,
                    maxLines: 3,
                    softWrap: true,
                    // check https://github.com/flutter/flutter/issues/58626
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ExpandableButton(
                  child: Text(strings.showMore),
                ),
              ],
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    pet.desc,
                  ),
                ),
                ExpandableButton(
                  child: Text(strings.showLess),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class AdoptRequestCard extends StatelessWidget {
  final bool disabled;

  const AdoptRequestCard({this.disabled = true, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                strings.adoptRequest,
                style: theme.textTheme.titleMedium,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(strings.adoptRequestButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
