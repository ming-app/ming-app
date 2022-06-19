import 'package:flutter/material.dart';
import '../mock/mock.dart';
import 'shelter_profile_form.dart';

class ShelterProfilePage extends StatelessWidget {
  const ShelterProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShelterProfileForm(shelterMock),
    );
  }
}
