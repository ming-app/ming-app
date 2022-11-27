import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/common/adaptive_builder.dart';
import 'package:ming/common/ui/pagination_bar.dart';
import 'package:ming/common/ui/selectable_text.dart';
import 'package:ming/pets/bloc/pets_bloc.dart';
import 'package:ming/pets/model/pet_overview_info.dart';
import 'package:ming_api/ming_api.dart';

import '../../common/ui/pet_card_content.dart';

class PetsForm extends StatefulWidget {
  final String shelterId;
  final int pageSize;
  final int pageNumber;
  final int totalPageNumaber;
  final List<PetOverviewInfo> pets;
  const PetsForm({
    Key? key,
    required this.shelterId,
    required this.pets,
    required this.pageSize,
    required this.pageNumber,
    required this.totalPageNumaber,
  }) : super(key: key);

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
          padding: const EdgeInsets.only(bottom: 24),
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
                  child: SelectableUnderlineText(
                    text: e.menuName,
                    isSelected: filter == e,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        AdaptiveBuilder(
          mobile: Column(
            children: List.generate(
              (widget.pets.length / 2).ceil(),
              (index) => widget.pets.sublist(
                  index * 2,
                  (index * 2 + 2) > widget.pets.length
                      ? widget.pets.length
                      : index * 2 + 2),
            )
                .map((rowEntity) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Row(
                        children: rowEntity
                            .map((entity) => Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: rowEntity.indexOf(entity) % 2 == 0
                                          ? 12
                                          : 0,
                                    ),
                                    child: PetCardContent(
                                      entity,
                                      isMobile: true,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ))
                .toList(),
          ),
          desktop: Wrap(
            spacing: 5,
            children: widget.pets
                .where((e) {
                  return filter.checkType(e.type);
                })
                .map((e) => PetCardContent(
                      e,
                      isMobile: false,
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Center(
          child: PaginationBar(
            pageNumber: widget.pageNumber,
            totalPageNumber: widget.totalPageNumaber,
            onPageChanged: (page) {
              context
                  .read<PetsBloc>()
                  .add(FetchPetsList(widget.shelterId, pageNumber: page));
            },
          ),
        ),
      ],
    );
  }
}

enum PetsFormFilter {
  all("전체"),
  cat("유기묘"),
  dog("유기견");

  final String menuName;

  const PetsFormFilter(this.menuName);

  bool checkType(AnimalType type) {
    if (this == all) return true;

    if (this == cat && type == AnimalType.cat) return true;
    if (this == dog && type == AnimalType.dog) return true;

    return false;
  }
}
