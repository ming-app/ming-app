import 'package:flutter/material.dart';

class DebugRootPage extends StatelessWidget {
  const DebugRootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("DebugRoot: 왼쪽 옆면을 통해 \npage drawer를 뽑아보세요."),
      ),
      drawer: MenuDrawer(),
    );
  }
}

// Debugging purpose menudrawer which will only active at debug mode
class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Icon(
                  Icons.account_circle,
                  size: 96,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.feed),
            title: const Text("Feed page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/feed');
            },
          ),
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text("Login page"),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
