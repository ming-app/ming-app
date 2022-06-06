import 'package:flutter/material.dart';

// todo: beatify login required form
class NotLoggedInForm extends StatelessWidget {
  final String? previousRoute;

  const NotLoggedInForm({Key? key, this.previousRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("로그인이 필요합니다."),
          ElevatedButton(
            onPressed: () {},
            child: const Text("로그인하기."),
          ),
        ],
      ),
    );
  }
}
