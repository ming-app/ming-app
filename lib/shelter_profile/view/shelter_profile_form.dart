import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ming/album/view/album_view.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/ui/thumbnail.dart';
import '../../generated/l10n.dart';
import '../../home/mock/mock.dart';
import '../../pets/view/pets_form.dart';
import '../mock/mock.dart';
import '../model/shelter_profile.dart';

class ShelterProfileForm extends StatelessWidget {
  final ShelterProfile shelter;
  const ShelterProfileForm(this.shelter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlbumView(shelter.id, true),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShelterDescription(shelter),
                        const ShelterCalender(),
                        ShelterLocationView(shelter.region),
                        ShelterManagerView(
                          shelter.manager.name,
                          shelter.manager.imageUrl,
                          shelter.manager.phoneNumber,
                        ),
                      ],
                    ),
                    flex: 2,
                  ),
                  const Expanded(
                    child: VolunteerReservationCard(true),
                    flex: 1,
                  ),
                ],
              ),
            ),
            Text(
              S.of(context).protectingPets,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            PetsForm(petsMock),
            const Divider(),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterCalender extends StatelessWidget {
  const ShelterCalender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            strings.volunteerSchedule,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: VolunteerScheduleListView(),
            ),
            Expanded(
              flex: 1,
              child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 90)),
                // todo: make this data change usable
                onDateChanged: (_) {},
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}

// todo
class VolunteerScheduleListView extends StatelessWidget {
  const VolunteerScheduleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ShelterLocationView extends StatelessWidget {
  final String address;

  const ShelterLocationView(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            strings.location,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                address,
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: address)).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(strings.completeCopyingAddress),
                      ),
                    );
                  });
                },
                child: Text(strings.copyAddress),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class ShelterManagerView extends StatelessWidget {
  final String managerName;
  final String? photoUrl;
  final String? phoneNumber;

  const ShelterManagerView(
    this.managerName,
    this.photoUrl,
    this.phoneNumber, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            strings.managerTitle,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (photoUrl != null) ThumbnailImage(Image.network(photoUrl!)),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.shelterOwner,
                    style: theme.textTheme.caption,
                  ),
                  Text(managerName),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: phoneNumber == null
                    ? null
                    : () => launchUrlString("tel:$phoneNumber"),
                child: Text(strings.doCall),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}

class ShelterDescription extends StatelessWidget {
  final ShelterProfile shelter;
  const ShelterDescription(this.shelter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          shelter.name,
          style: theme.textTheme.titleMedium,
        ),
        Row(
          children: [
            Text(
              strings.anbandonedDogString +
                  " ${shelter.numberOfDogs}" +
                  strings.unitStringOfPet +
                  " · " +
                  strings.abandonedCatString +
                  " ${shelter.numberOfCats}" +
                  strings.unitStringOfPet,
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
          child: Text(
            "⭐ ${shelter.averageRate} · " +
                strings.review +
                "${shelter.reviewCount}" +
                strings.unitStringOfShelter +
                " · " +
                shelter.region,
          ),
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
                "${shelter.numberOfVolunteers}" +
                    strings.volunteerNumberSentenceString,
              ),
            ],
          ),
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
                    shelter.desc,
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
                    shelter.desc,
                  ),
                ),
                ExpandableButton(
                  child: Text(strings.showLess),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider(),
      ],
    );
  }
}

class VolunteerReservationCard extends StatelessWidget {
  final bool disabled;
  const VolunteerReservationCard(this.disabled, {Key? key}) : super(key: key);

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
                S.of(context).reserveVolunteer,
                style: theme.textTheme.titleMedium,
              ),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: strings.date),
              style: theme.textTheme.bodyText2,
              readOnly: true,
              initialValue: "6월 19일 2022년",
            ),
            TextFormField(
              decoration: InputDecoration(labelText: strings.time),
              style: theme.textTheme.bodyText2,
              readOnly: true,
              initialValue: "12:00",
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: strings.numberOfVolunteers),
              style: theme.textTheme.bodyText2,
              readOnly: true,
              initialValue: "1명",
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Center(child: Text("예약하기")),
            ),
          ],
        ),
      ),
    );
  }
}
