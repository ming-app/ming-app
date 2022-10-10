import 'package:expandable/expandable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ming/album/view/album_view.dart';
import 'package:ming/common/snackbar_service.dart';
import 'package:ming/pets/view/pets_view.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:universal_html/html.dart' as html;

import '../../common/ui/contact_to_shelter_card.dart';
import '../../common/ui/thumbnail.dart';
import '../../generated/l10n.dart';
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
                        ShelterManagerView(
                          shelter.manager.name,
                          shelter.manager.imageUrl,
                          shelter.manager.phoneNumber,
                          shelter.region,
                        ),
                      ],
                    ),
                    flex: 2,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  ContactToShelterButton(
                    onClick: shelter.manager.phoneNumber == null
                        ? null
                        : () => launchUrlString(
                            "tel:${shelter.manager.phoneNumber}"),
                  ),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(
                top: 32,
                bottom: 32,
              ),
              child: Text(
                S.of(context).protectingPets,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            PetsView(shelter.id),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ShelterManagerView extends StatelessWidget {
  final String managerName;
  final String? address;
  final String? photoUrl;
  final String? phoneNumber;

  const ShelterManagerView(
    this.managerName,
    this.photoUrl,
    this.phoneNumber,
    this.address, {
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
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Text(
            strings.managerTitle,
            style: theme.textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (photoUrl != null)
                ThumbnailImage(
                  Image.network(photoUrl!),
                  size: Size(56, 56),
                ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    managerName,
                    style: theme.textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    address ?? "",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    textStyle: Theme.of(context).textTheme.bodySmall,
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: address));
                  SnackbarService(context)
                      .showPlainTextSnackbar("주소가 클립보드에 복사되었습니다.");
                },
                child: Text(
                  S.of(context).copyAddress,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
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
          style: theme.textTheme.displayMedium,
        ),
        SizedBox(
          height: 8,
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
              style: theme.textTheme.bodySmall,
            ),
            const Spacer(),
            TextButton(
              onPressed: () async {
                if (kIsWeb) {
                  var url = html.window.location.href;
                  await Clipboard.setData(ClipboardData(text: url));
                  SnackbarService(context)
                      .showPlainTextSnackbar("주소가 클립보드에 복사되었습니다.");
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                textStyle: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              child: Text(
                S.of(context).share,
              ),
            ),
          ],
        ),
        const Divider(),
        ExpandableNotifier(
          child: Expandable(
            collapsed: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    bottom: 24,
                  ),
                  child: Text(
                    shelter.desc,
                    maxLines: 3,
                    softWrap: true,
                    // check https://github.com/flutter/flutter/issues/58626
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ExpandableButton(
                  child: Text(
                    strings.showMore,
                    style: theme.textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 32,
                    bottom: 24,
                  ),
                  child: Text(
                    shelter.desc,
                  ),
                ),
                ExpandableButton(
                  child: Text(
                    strings.showLess,
                    style: theme.textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const Divider(),
      ],
    );
  }
}
