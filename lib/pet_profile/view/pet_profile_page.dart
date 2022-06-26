import 'package:flutter/material.dart';
import 'package:ming/pet_profile/mock/mock.dart';
import 'package:ming/pet_profile/view/pet_profile_form.dart';

class PetProfilePage extends StatelessWidget {
  const PetProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PetProfileForm(petMock),
    );
  }
}
