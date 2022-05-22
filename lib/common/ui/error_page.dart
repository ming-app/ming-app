import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

// todo: beautify this.
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: Center(
        child: Text(S.of(context).errorMessage),
      ),
    );
  }
}
