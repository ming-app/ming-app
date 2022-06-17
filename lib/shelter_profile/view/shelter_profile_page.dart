import 'package:flutter/material.dart';
import 'package:ming/shelter_profile/mock/mock.dart';
import 'package:ming/shelter_profile/view/shelter_profile_form.dart';

class ShelterProfilePage extends StatelessWidget {
  const ShelterProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShelterProfileForm(shelterMock),
    );
  }
}
