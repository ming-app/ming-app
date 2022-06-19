import 'package:flutter/material.dart';
import '../mock/mock.dart';

import 'shelter_location_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/home_image.png'),
          ShetlerRegionInfoForm(regions),
        ],
      ),
    );
  }
}
