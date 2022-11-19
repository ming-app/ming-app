import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/auth/bloc/auth_bloc.dart';
import 'package:ming/common/ming_icons.dart';
import 'package:ming/generated/l10n.dart';
import 'package:ming/login/view/login_dialog.dart';

import '../routes.dart';

class MobileAdaptiveNavigation extends StatelessWidget {
  const MobileAdaptiveNavigation({
    super.key,
    required this.selectedIndex,
    required this.child,
  });

  final int selectedIndex;
  final Widget child;

  void _onNavigatorTap(BuildContext context, int idx, bool isLogIn) {
    if (idx == MingNavigator.values.length) {
      if (isLogIn) {
        context.go(MingRoutingAddress.myProfile.address);
      } else {
        showDialog(context: context, builder: (context) => LoginDialog());
      }
    } else {
      context.go(MingNavigator.values[idx].routes.address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: child,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (value) =>
                _onNavigatorTap(context, value, state is Authenticated),
            unselectedItemColor: Colors.grey.shade300,
            selectedItemColor: Colors.black,
            items: MingNavigator.values
                    .map(
                      (e) => BottomNavigationBarItem(
                        icon: e.icon,
                        label: e.label,
                      ),
                    )
                    .toList() +
                [
                  BottomNavigationBarItem(
                    icon: const Icon(MingIcons.profile),
                    label: state is Authenticated
                        ? S.of(context).profile
                        : S.of(context).loginButtonText,
                  )
                ],
          ),
        );
      },
    );
  }
}
