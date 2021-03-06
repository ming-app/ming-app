import 'package:flutter/material.dart';

import '../../common/ui/pet_card_content.dart';
import '../../pet_profile/model/pet_profile.dart';

class PetsForm extends StatefulWidget {
  final List<PetProfile> pets;
  const PetsForm(this.pets, {Key? key}) : super(key: key);

  @override
  State<PetsForm> createState() => _PetsFormState();
}

class _PetsFormState extends State<PetsForm> {
  PetsFormFilter filter = PetsFormFilter.all;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: PetsFormFilter.values.map((e) {
              return InkWell(
                onTap: () {
                  setState(() {
                    filter = e;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    e.menuName,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          decoration: filter == e
                              ? TextDecoration.underline
                              : TextDecoration.none,
                        ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        Wrap(
          spacing: 5,
          children: widget.pets
              .where((e) {
                if (filter == PetsFormFilter.all) {
                  return true;
                } else {
                  var filterIsDog = filter == PetsFormFilter.dog;
                  if (filterIsDog == e.isDog) {
                    return true;
                  }
                }
                return false;
              })
              .map((e) => PetCardContent(
                    name: e.name,
                    isFemale: e.isFemale,
                    age: e.age,
                    desc: e.desc,
                    numberOfVolunteer: e.numberOfVolunteer,
                    imageUrl: e.imageUrl,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

enum PetsFormFilter {
  all("??????"),
  cat("?????????"),
  dog("?????????");

  final String menuName;

  const PetsFormFilter(this.menuName);
}
