import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/common/ui/error_page.dart';
import 'package:ming/shelters/model/shelters_info.dart';
import 'package:ming/shelters/shelters.dart';

import 'shelters_form.dart';

class SheltersPage extends StatelessWidget {
  const SheltersPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SheltersBloc, SheltersState>(
        builder: (context, state) {
          var info = SheltersInfo.empty();

          context.loaderOverlay.hide();

          if (state is SheltersUninitialized) {
            context.read<SheltersBloc>().add(SheltersFetch());
          } else if (state is SheltersLoaded) {
            info = state.shelters;
          } else if (state is SheltersOnLoading) {
            context.loaderOverlay.show();
          } else if (state is SheltersError) {
            return const ErrorPage(message: "보호소 데이터를 가져오지 못했습니다.");
          }

          return SheltersForm(info);
        },
      ),
    );
  }
}
