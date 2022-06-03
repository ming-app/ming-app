import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/on_the_construction.dart';
import 'package:ming/user_profile/view/user_profile_page.dart';

import '../generated/l10n.dart';
import '../login/login.dart';
import '../sign_up/sign_up.dart';
import 'ui/root_layout.dart';

// to maintain the status of page and scaffold status.
const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

enum MingNavigator {
  home('/home', "Home", Icon(Icons.home_filled)),
  shelter('/shelters', "Shelter", Icon(Icons.pets)),
  profile('/profile', "Profile", Icon(Icons.person)),
  setting('/setting', "Setting", Icon(Icons.settings));

  final String route;
  final String label;
  final Icon icon;

  const MingNavigator(this.route, this.label, this.icon);

  @override
  String toString() => label;

  int offset() => MingNavigator.values.lastIndexOf(this);
}

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    // Login Page
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: LoginPage(),
      ),
    ),

    // Sign Up Page
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: SignUpPage(),
      ),
    ),

    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: MingNavigator.home.offset(),
          child: OntheConstructionPage(title: S.of(context).homePageTitle),
        ),
      ),
    ),

    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: MingNavigator.profile.offset(),
          child: const UserProfilePage(),
        ),
      ),
    ),

    GoRoute(
      path: '/setting',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: MingNavigator.setting.offset(),
          child: OntheConstructionPage(title: S.of(context).settingPageTitle),
        ),
      ),
    ),

    // Shelter page
    GoRoute(
      path: '/shelters',
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: MingNavigator.shelter.offset(),
          child: OntheConstructionPage(title: S.of(context).shelterPageTitle),
        ),
      ),
      routes: [
        GoRoute(
          path: ':shelterId',
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: RootLayout(
              key: _scaffoldKey,
              currentIndex: MingNavigator.shelter.offset(),
              child: OntheConstructionPage(
                  title: S.of(context).shelterSinglePageTitle),
            ),
          ),
          routes: [
            GoRoute(
              path: ':petId',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: RootLayout(
                  child:
                      OntheConstructionPage(title: S.of(context).petPageTitle),
                  currentIndex: MingNavigator.shelter.offset(),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);
