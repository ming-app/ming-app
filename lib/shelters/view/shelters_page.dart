import 'package:flutter/material.dart';
import 'package:ming/shelters/mock/shelters_mock.dart';

import 'shelters_form.dart';

class SheltersPage extends StatelessWidget {
  const SheltersPage({Key? key, this.onlyAuthenticated = false})
      : super(key: key);
  final bool onlyAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // todo: change mock into real one.
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: SheltersForm(mockSheltersInfo),
      ),
    );
  }
}
