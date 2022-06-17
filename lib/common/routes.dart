import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:log/log.dart';
import 'package:ming/common/ui/error_page.dart';
import 'package:ming/shelter_profile/view/shelter_profile_page.dart';
import 'package:ming/user_profile/cubit/user_profile_cubit.dart';

import '../generated/l10n.dart';
import '../home/view/home_page.dart';
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
  home(MingRoutingAddress.home, "홈", Icon(Icons.home_filled)),
  shelters(MingRoutingAddress.shelters, "보호소", Icon(Icons.night_shelter)),
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
    key: _pageKey,
    child: RootLayout(
      key: _scaffoldKey,
      currentIndex: MingNavigator.home.offset(),
      child: ErrorPage(message: state.error.toString()),
    ),
  ),
  routes: [
    // Login Page
    GoRoute(
      path: MingRoutingAddress.login.address,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: -1,
          child: LoginPage(),
        ),
      ),
    ),

    // Sign Up Page
    GoRoute(
      path: MingRoutingAddress.signup.address,
      pageBuilder: (context, state) => const MaterialPage<void>(
        key: _pageKey,
        child: RootLayout(
          key: _scaffoldKey,
          currentIndex: -1,
          child: SignUpPage(),
        ),
      ),
    ),

    // Home Page
    GoRoute(
        path: MingRoutingAddress.home.address,
        pageBuilder: (context, state) {
          Log.i('go to home page.');
          return MaterialPage<void>(
            key: _pageKey,
            child: RootLayout(
              key: _scaffoldKey,
              currentIndex: MingNavigator.home.offset(),
              child: const HomePage(),
            ),
          );
        }),

    // User page
    GoRoute(
      path: MingRoutingAddress.myProfile.address,
      pageBuilder: (context, state) {
        Log.i('go to user page.');

        context.read<UserProfileCubit>().initialize();

        return const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: -1,
            child: UserProfilePage(),
          ),
        );
      },
    ),

    // Shelter page
    // e.g. shelters?auth=true&region=seoul
    GoRoute(
      path: MingRoutingAddress.shelters.address,
      pageBuilder: (context, state) {
        final onlyAuthenticated =
            (state.queryParams['auth'] ?? "false") == "true";

        // todo: handle regional query
        final region = state.queryParams['region'];

        Log.i(
            'go to shelters page with query auth: $onlyAuthenticated, region: $region');

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
            pageBuilder: (context, state) {
              final id = state.params[MingRoutingAddress.shelterId.getParam()];

              Log.i('go to shelter page with id $id');

              return MaterialPage<void>(
                key: state.pageKey,
                child: RootLayout(
                  key: _scaffoldKey,
                  currentIndex: MingNavigator.shelters.offset(),
                  child: const ShelterProfilePage(),
                ),
              );
            }),
      ],
    ),
  ],
);
