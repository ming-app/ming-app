import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

// todo: beautify this.
class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, this.message}) : super(key: key);
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(S.of(context).errorMessage),
            message != null ? Text(message!) : Container(),
          ],
        ),
      ),
    );
  }
}
