import 'package:flutter/material.dart';
import 'package:ming/common/routes.dart';

import 'menu_bar.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
  });

  final List<MingNavigator> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(
        destinations: destinations,
        selectedIndex: selectedIndex,
      ),
      body: child,
    );
  }
}
