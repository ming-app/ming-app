import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/album/view/album_view.dart';
import 'package:ming/common/adaptive_builder.dart';
import 'package:ming/common/ming_icons.dart';
import 'package:ming/common/routes.dart';
import 'package:ming/common/ui/contact_to_shelter_card.dart';
import 'package:ming/common/ui/shelter_card_content.dart';
import 'package:ming/pet_profile/model/pet_profile.dart';
import 'package:ming/shelters/model/shelter_overview_info.dart';
import 'package:ming_api/entities/image.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:universal_html/html.dart' as html;

import '../../common/snackbar_service.dart';
import '../../generated/l10n.dart';

class PetProfileForm extends StatelessWidget {
  final ShelterOverviewInfo shelter;
  final PetProfile pet;
  const PetProfileForm(
    this.shelter,
    this.pet, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilder(
      mobile: PetProfileMobileForm(pet: pet, shelter: shelter),
      desktop: PetProfileDesktopForm(pet: pet, shelter: shelter),
    );
  }
}

class PetProfileMobileForm extends StatelessWidget {
  const PetProfileMobileForm({
    Key? key,
    required this.pet,
    required this.shelter,
  }) : super(key: key);

  final PetProfile pet;
  final ShelterOverviewInfo shelter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AlbumView(pet.id, ImageType.animal),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PetDescription(
                        pet,
                        hideShareButton: true,
                      ),
                      ShelterProfileView(
                        theme: theme,
                        shelter: shelter,
                        isMobile: true,
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 14,
          left: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              iconSize: 24,
              onPressed: () {
                context
                    .go(MingRoutingAddress.shelters.address + "/${shelter.id}");
              },
              icon: Icon(MingIcons.leftArrow),
            ),
          ),
        ),
        Positioned(
          top: 14,
          right: 16,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              iconSize: 24,
              onPressed: () async {
                if (kIsWeb) {
                  var url = html.window.location.href;
                  await Clipboard.setData(ClipboardData(text: url));
                  SnackbarService(context)
                      .showPlainTextSnackbar("주소가 클립보드에 복사되었습니다.");
                }
              },
              icon: Icon(MingIcons.upload),
            ),
          ),
        ),
        Positioned(
          left: 16,
          right: 16,
          bottom: 5,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 0),
                backgroundColor: Color(0xffda4d2e),
                foregroundColor: Colors.white,
                textStyle: Theme.of(context).textTheme.bodySmall,
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 18,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            onPressed: shelter.phoneNumber == null
                ? null
                : () => launchUrlString("tel:${shelter.phoneNumber}"),
            child: Text(
              S.of(context).contact,
            ),
          ),
        ),
      ],
    );
  }
}

class PetProfileDesktopForm extends StatelessWidget {
  const PetProfileDesktopForm({
    Key? key,
    required this.pet,
    required this.shelter,
  }) : super(key: key);

  final PetProfile pet;
  final ShelterOverviewInfo shelter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlbumView(pet.id, ImageType.animal),
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
                        ShelterProfileView(theme: theme, shelter: shelter),
                      ],
                    ),
                    flex: 2,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ContactToShelterButton(
                    onClick: () =>
                        launchUrlString("tel:${shelter.phoneNumber}"),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterProfileView extends StatelessWidget {
  const ShelterProfileView({
    Key? key,
    required this.theme,
    required this.shelter,
    this.isMobile = false,
  }) : super(key: key);

  final ThemeData theme;
  final ShelterOverviewInfo shelter;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "보호소",
            style: theme.textTheme.titleMedium,
          ),
          ShelterCardContent(
            shelter,
            isMobile: isMobile,
          ),
        ],
      ),
    );
  }
}

class PetDescription extends StatelessWidget {
  final PetProfile pet;
  final bool hideShareButton;
  const PetDescription(
    this.pet, {
    Key? key,
    this.hideShareButton = false,
  }) : super(key: key);

  DateTime get registeredDate => DateTime.parse(pet.registeredAt);
  int get _protectedDate => DateTime.now().difference(registeredDate).inDays;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final strings = S.of(context);
    final birth = DateTime.parse(pet.birth);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              pet.name,
              style: theme.textTheme.displayMedium,
            ),
            const Spacer(),
            hideShareButton
                ? Container()
                : TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    child: Text(
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
              const Icon(MingIcons.calender),
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
                MingIcons.favorite,
                pet.isDog ? strings.dog : strings.cat,
              ),
              Tuple2<IconData, String>(
                MingIcons.favorite,
                pet.breed,
              ),
              Tuple2<IconData, String>(
                pet.isFemale ? MingIcons.female : MingIcons.male,
                pet.isFemale ? strings.femaleString : strings.maleString,
              ),
              Tuple2<IconData, String>(
                MingIcons.favorite,
                pet.isNeutralized ? "중성화 수술 함" : "중성화 수술 안함",
              ),
              Tuple2<IconData, String>(
                MingIcons.favorite,
                "${pet.weight}kg",
              ),
              Tuple2<IconData, String>(
                MingIcons.favorite,
                "${birth.year}년 ${birth.month}월 생",
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
                MingIcons.document, pet.registeredAt, "접수 일시"),
            Tuple3<IconData, String, String>(
                MingIcons.location, pet.foundAt, "발생 장소"),
            Tuple3<IconData, String, String>(
                MingIcons.directionBoard, pet.managingRegion, "관할 지역"),
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
