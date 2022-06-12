import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/routes.dart';
import 'package:ming/shelters/model/shelters_info.dart';
import 'package:ming_api/ming_api.dart';

import '../../common/ui/thumbnail.dart';
import '../../generated/l10n.dart';
import '../../home/mock/mock.dart';

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
            info.numberOfShelters,
            info.numberOfProtectingPets,
            info.numberOfAdoptedPets,
            info.numberOfVolunteers,
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

class ShelterCardContent extends StatelessWidget {
  const ShelterCardContent(this.shelter, {Key? key}) : super(key: key);

  final Shelter shelter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final descriptionStyle = theme.textTheme.subtitle1!;

    return InkWell(
      onTap: () {
        context.go(MingRoutingAddress.shelters.address + "/id");
      },
      child: SizedBox(
        width: 230,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130,
                child: Stack(
                  children: [
                    if (shelter.imageUrl != null)
                      Positioned.fill(
                        child: Ink.image(
                          image: NetworkImage(shelter.imageUrl!),
                          fit: BoxFit.cover,
                          child: Container(),
                        ),
                      ),
                  ],
                ),
              ),
              // Description and share/explore buttons.
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
                        style: theme.textTheme.caption,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        shelter.name,
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        "유기견 "
                                "${shelter.numberOfDogs}" +
                            S.of(context).unitStringOfPet +
                            " · " "유기묘" "${shelter.numberOfCats}" +
                            S.of(context).unitStringOfPet,
                        style: theme.textTheme.caption,
                        softWrap: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // todo: fill this with actual users photo
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${shelter.numberOfVolunteers}명의 봉사자가 활동하고 있어요.",
                        style: theme.textTheme.caption,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// todo: make this widget as infinete scrolling
class SheltersListView extends StatelessWidget {
  final List<Shelter> shelters;

  const SheltersListView(this.shelters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: shelters.map((e) => ShelterCardContent(e)).toList(),
    );
  }
}

class SheltersStatisticsInformation extends StatelessWidget {
  final int numberOfShelters;
  final int numberOfProtectingPets;
  final int numberOfAdoptedPets;
  final int numberOfVolunteers;

  const SheltersStatisticsInformation(
    this.numberOfShelters,
    this.numberOfProtectingPets,
    this.numberOfAdoptedPets,
    this.numberOfVolunteers, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShelterStatisticsItem(
            name: S.of(context).shelter,
            unitString: S.of(context).unitStringOfShelter,
            number: numberOfShelters,
            iconColor: Colors.white,
            iconBackgroundColor: Colors.deepOrange,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ShelterStatisticsItem(
            name: S.of(context).protectingPet,
            unitString: S.of(context).unitStringOfPet,
            number: numberOfProtectingPets,
            iconColor: Colors.white,
            iconBackgroundColor: Colors.yellow,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ShelterStatisticsItem(
            name: S.of(context).adoptedPet,
            unitString: S.of(context).unitStringOfShelter,
            number: numberOfAdoptedPets,
            iconBackgroundColor: Colors.grey[400]!,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ShelterStatisticsItem(
            name: S.of(context).volunteer,
            unitString: S.of(context).unitStringOfPerson,
            number: numberOfVolunteers,
            iconColor: Colors.white,
            iconBackgroundColor: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class ShelterStatisticsItem extends StatelessWidget {
  final String name;
  final String unitString;
  final int number;
  final Color iconColor;
  final Color iconBackgroundColor;

  const ShelterStatisticsItem({
    required this.name,
    required this.unitString,
    required this.number,
    this.iconColor = Colors.black,
    this.iconBackgroundColor = Colors.white,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.search,
              size: 15,
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$number$unitString",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
