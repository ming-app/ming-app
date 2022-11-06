import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/auth/bloc/auth_bloc.dart';
import '../../login/view/not_logged_in_form.dart';

import '../../common/ui/error_page.dart';
import '../user_profile.dart';
import 'user_profile_form.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        if (previous is! Authenticated && current is Authenticated) return true;
        return false;
      },
      listener: (context, state) {
        context.read<UserProfileCubit>().getUserProfile();
      },
      child: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileError) {
            context.loaderOverlay.hide();
            return ErrorPage(message: state.message);
          }

          if (state is UserProfileInitial) {
            context.read<UserProfileCubit>().getUserProfile();
            context.loaderOverlay.show();
            return UserProfileForm(state.user);
          }

          if (state is UserProfileNotLoggedIn) {
            context.loaderOverlay.hide();
            return const NotLoggedInForm();
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
