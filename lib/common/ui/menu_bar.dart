import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/login/view/login_dialog.dart';
import '../../auth/bloc/auth_bloc.dart';
import '../routes.dart';
import '../../generated/l10n.dart';
import 'selectable_text.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget {
  const MenuBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
  });

  final List<MingNavigator> destinations;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: InkWell(
                  onTap: () => context.go(MingRoutingAddress.root.address),
                  child: Text(
                    S.of(context).appTitle,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: Wrap(
                  children: destinations
                      .map(
                        (e) => MenuItem(
                          e,
                          destinations.indexOf(e) == selectedIndex,
                        ),
                      )
                      .toList(),
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(right: 15),
                child: UserMenuItem(),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(170);
}

class MenuItem extends StatelessWidget {
  final MingNavigator dest;
  final bool isSelected;

  const MenuItem(this.dest, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: InkWell(
        onTap: () => context.go(dest.routes.address),
        child: SelectableUnderlineText(
          text: dest.label,
          isSelected: isSelected,
          boldSelectedItem: true,
        ),
      ),
    );
  }
}

class UserMenuItem extends StatelessWidget {
  const UserMenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return IconButton(
            onPressed: () => context.go(MingRoutingAddress.myProfile.address),
            icon: const Icon(Icons.person),
          );
        }

        return TextButton(
          onPressed: () =>
              showDialog(context: context, builder: (_) => LoginDialog()),
          child: Text(
            S.of(context).loginButtonText,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}
