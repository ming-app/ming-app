import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class SheltersStatisticsInformation extends StatelessWidget {
  final int? numberOfShelters;
  final int numberOfProtectingPets;
  final int numberOfAdoptedPets;
  final int numberOfVolunteers;

  const SheltersStatisticsInformation(
    this.numberOfProtectingPets,
    this.numberOfAdoptedPets,
    this.numberOfVolunteers, {
    this.numberOfShelters,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (numberOfShelters != null)
          Expanded(
            child: ShelterStatisticsItem(
              name: S.of(context).shelter,
              unitString: S.of(context).unitStringOfShelter,
              number: numberOfShelters!,
              iconColor: Colors.white,
              iconBackgroundColor: Colors.deepOrange,
            ),
          ),
        if (numberOfShelters != null)
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
