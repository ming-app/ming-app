import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

// todo: beautify this.
class OntheConstructionPage extends StatelessWidget {
  final String title;
  const OntheConstructionPage({Key? key, this.title = "준비 중입니다."})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: false,
      ),
      body: Center(
        child: Text(S.of(context).onTheConstruction),
      ),
    );
  }
}
