import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/ui/error_page.dart';

import '../generated/l10n.dart';
import '../login/login.dart';
import '../shelters/shelters.dart';
import '../shelters/view/shelters_page.dart';
import '../sign_up/sign_up.dart';
import '../user_profile/view/user_profile_page.dart';
import 'ui/on_the_construction.dart';
import 'ui/root_layout.dart';

// to maintain the status of page and scaffold status.
const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

/// Routing address summary
/// In case of param address, it should be start with ':'
enum MingRoutingAddress {
  home('/home'),

  // Shelter
  shelters('/shelters'),
  shelterId(':shelterId'),
  // Pets
  pets('/pets'),
  petId(':petId'),
  // User
  myProfile('/users/me'),

  // etc.
  login('/login'),
  signup('/signup'),
  ;

  final String address;

  const MingRoutingAddress(this.address);

  String getParam() {
    if (!address.startsWith(':')) {
      // it is not param
      throw ArgumentError("this is not param routing string: $address");
    }

    return address.replaceFirst(':', '');
  }

  @override
  String toString() => address;
}

enum MingNavigator {
  home(MingRoutingAddress.home, "Home", Icon(Icons.home_filled)),
  shelters(MingRoutingAddress.shelters, "Shelters", Icon(Icons.night_shelter)),
  pets(MingRoutingAddress.pets, "Pets", Icon(Icons.pets)),
  myProfile(MingRoutingAddress.myProfile, "Profile", Icon(Icons.person)),
  ;

  final MingRoutingAddress routes;
  final String label;
  final Icon icon;

  const MingNavigator(this.routes, this.label, this.icon);

  @override
  String toString() => label;

  int offset() => MingNavigator.values.lastIndexOf(this);
}

final router = GoRouter(
  initialLocation: MingRoutingAddress.home.address,
  errorPageBuilder: (BuildContext context, GoRouterState state) =>
      MaterialPage<void>(
    child: ErrorPage(message: state.error.toString()),
  ),
  routes: [
    // Login Page
    GoRoute(
      path: MingRoutingAddress.login.address,
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: LoginPage(),
      ),
    ),

    // Sign Up Page
    GoRoute(
      path: MingRoutingAddress.signup.address,
      pageBuilder: (context, state) => const MaterialPage<void>(
        child: SignUpPage(),
      ),
    ),

    GoRoute(
      path: MingRoutingAddress.home.address,
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
      path: MingRoutingAddress.myProfile.address,
      pageBuilder: (context, state) => MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: MingNavigator.myProfile.offset(),
          child: const UserProfilePage(),
        ),
      ),
    ),

    // Shelter page
    GoRoute(
      path: MingRoutingAddress.shelters.address,
      pageBuilder: (context, state) {
        final onlyAuthenticated =
            (state.queryParams['auth'] ?? "false") == "true";

        context.read<SheltersBloc>().add(
              SheltersFetch(onlyAuthenticated: onlyAuthenticated),
            );

        return MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: MingNavigator.shelters.offset(),
            child: SheltersPage(
              onlyAuthenticated: onlyAuthenticated,
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          path: MingRoutingAddress.shelterId.address,
          pageBuilder: (context, state) => MaterialPage<void>(
            key: state.pageKey,
            child: RootLayout(
              key: _scaffoldKey,
              currentIndex: MingNavigator.shelters.offset(),
              child: OntheConstructionPage(
                  title: S.of(context).shelterSinglePageTitle),
            ),
          ),
        ),
      ],
    ),
  ],
);
