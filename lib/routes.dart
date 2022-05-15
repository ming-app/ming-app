import 'package:flutter/material.dart';

import 'debug_root_page.dart';
import 'feed/feed.dart';
import 'login/login.dart';
import 'sign_up/sign_up.dart';

final routes = {
  '/debug_root': (BuildContext context) => const DebugRootPage(),
  '/feed': (BuildContext context) => const PetFeedPage(),
  '/signup': (BuildContext context) => const SignUpPage(),
  '/login': (BuildContext context) => const LoginPage(),
};
