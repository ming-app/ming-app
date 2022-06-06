import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ming/common/routes.dart';
import 'package:ming/generated/l10n.dart';

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
                  onTap: () => context.go(MingRoutingAddress.home.address),
                  child: Text(
                    S.of(context).appTitle,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ),
              ),
              Flexible(
                flex: 8,
                child: Container(
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
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  onPressed: () => context.go(MingRoutingAddress.login.address),
                  icon: const Icon(Icons.person),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
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
    return TextButton(
      onPressed: () => context.go(dest.routes.address),
      child: Text(
        dest.label,
        style: TextStyle(
          decoration:
              isSelected ? TextDecoration.underline : TextDecoration.none,
        ),
      ),
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      )),
    );
  }
}
