import 'package:flutter/material.dart';

class SnackbarService {
  final BuildContext context;

  SnackbarService(this.context);

  void showPlainTextSnackbar(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
