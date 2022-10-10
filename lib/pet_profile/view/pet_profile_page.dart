import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/pet_profile/bloc/pet_profile_bloc.dart';
import 'package:ming/pet_profile/mock/mock.dart';
import 'package:ming/pet_profile/view/pet_profile_form.dart';
import 'package:ming/shelters/mock/shelters_mock.dart';

import '../../common/ui/error_page.dart';

class PetProfilePage extends StatelessWidget {
  final String petId;

  const PetProfilePage({
    Key? key,
    required this.petId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _fetchAndReturnEmpty() {
      context.read<PetProfileBloc>().add(PetProfileFetch(petId));
      return Container();
    }

    return Scaffold(
      body: BlocBuilder<PetProfileBloc, PetProfileState>(
        builder: ((context, state) {
          context.loaderOverlay.hide();

          if (state is PetProfileInitial) {
            return _fetchAndReturnEmpty();
          } else if (state is PetProfileFetched) {
            if (state.profile.id != petId) {
              return _fetchAndReturnEmpty();
            }

            return PetProfileForm(state.shelter, state.profile);
          } else if (state is PetProfileOnLoading) {
            context.loaderOverlay.show();
            return Container();
          } else if (state is PetProfileError) {
            return const ErrorPage(
              message: "동물 정보 데이터를 가져오는 데에 실패하였습니다.",
            );
          }

          return const ErrorPage(
            message: "알 수 없는 에러가 발생했습니다.",
          );
        }),
      ),
    );
  }
}
