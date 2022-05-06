import 'package:flutter/material.dart';
import 'package:ming/ui/screens/pet_feed_page.dart';

import 'ui/screens/debug_root_page.dart';

final routes = {
  '/debug_root' : (BuildContext context) => const DebugRootPage(),
  '/feed': (BuildContext context) => const PetFeedPage(),
};
