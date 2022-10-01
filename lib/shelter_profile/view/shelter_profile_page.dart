import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/common/ui/error_page.dart';
import '../bloc/shelter_profile_bloc.dart';
import 'shelter_profile_form.dart';

class ShelterProfilePage extends StatelessWidget {
  final String shelterId;

  const ShelterProfilePage({
    Key? key,
    required this.shelterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _fetchAndReturnEmpty() {
      context.read<ShelterProfileBloc>().add(ShelterProfileFetch(shelterId));

      return Container();
    }

    return Scaffold(
      body: BlocBuilder<ShelterProfileBloc, ShelterProfileState>(
        builder: (context, state) {
          context.loaderOverlay.hide();

          if (state is ShelterProfileInitial) {
            return _fetchAndReturnEmpty();
          } else if (state is ShelterProfileFetched) {
            if (state.profile.id != shelterId) {
              return _fetchAndReturnEmpty();
            }

            return ShelterProfileForm(state.profile);
          } else if (state is ShelterProfileOnLoading) {
            context.loaderOverlay.show();
            return Container();
          } else if (state is ShelterProfileError) {
            return const ErrorPage(
              message: "보호소 프로파일 데이터를 가져오는데에 실패하였습니다.",
            );
          }

          return const ErrorPage(
            message: "알 수 없는 에러가 발생하였습니다.",
          );
        },
      ),
    );
  }
}
