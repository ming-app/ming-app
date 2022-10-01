import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ming/common/ming_icons.dart';

import '../../generated/l10n.dart';

class MingBottomSheet extends StatelessWidget {
  const MingBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Theme.of(context).bottomAppBarColor,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 6, 40, 6),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('© 2022 ${S.of(context).appTitle}'),
              const Text(' · '),
              const Text('Privacy'),
              const Text(' · '),
              const Text('Terms'),
              const Text(' · '),
              const Text('Sitemap'),
              const Spacer(),
              const Icon(
                MingIcons.instagram,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
