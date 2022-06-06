import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes.dart';

import 'adaptive_navigation.dart';

class RootLayout extends StatelessWidget {
  const RootLayout({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  final Widget child;
  final int currentIndex;
  static const _switcherKey = ValueKey('switcherKey');
  static const _navigationRailKey = ValueKey('navigationRailKey');

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      void onSelected(int index) {
        final destination = MingNavigator.values[index];
        GoRouter.of(context).go(destination.routes.address);
      }

      return AdaptiveNavigation(
        key: _navigationRailKey,
        destinations: MingNavigator.values,
        selectedIndex: currentIndex,
        onDestinationSelected: onSelected,
        child: Column(
          children: [
            Expanded(
              child: _Switcher(
                key: _switcherKey,
                child: child,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class _Switcher extends StatelessWidget {
  final bool isDesktop = defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;
  final Widget child;

  _Switcher({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isDesktop
        ? child
        : AnimatedSwitcher(
            key: key,
            duration: const Duration(milliseconds: 200),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: child,
          );
  }
}
