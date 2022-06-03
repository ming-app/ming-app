import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../common/ui/error_page.dart';
import '../user_profile.dart';
import 'user_profile_form.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("유저 정보"),
        centerTitle: false,
      ),
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileError) {
            return ErrorPage(message: state.message);
          }

          if (state is UserProfileInitial) {
            context.read<UserProfileCubit>().getUserProfile();
          }

          if (state is UserProfileUpdating) {
            context.loaderOverlay.show();
          } else {
            context.loaderOverlay.hide();
          }

          return UserProfileForm(state.user);
        },
      ),
    );
  }
}
