import 'package:flutter/material.dart';

const mobileMaximumWidth = 600;

class AdaptiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;

  const AdaptiveBuilder({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, dimens) {
        if (dimens.maxWidth < mobileMaximumWidth) {
          return mobile;
        }
        return desktop;
      }),
    );
  }
}
