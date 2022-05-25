import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming_api/model/model.dart';

import '../../common/ui/error_page.dart';
import '../user_profile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("유저 정보 (추후 이쁘게 만들거심)"),
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

          return UserProfileForm(state.user);
        },
      ),
    );
  }
}

class UserProfileForm extends StatelessWidget {
  const UserProfileForm(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(user.uid),
          Text(user.email),
          Text("이름: ${user.name}"),
        ],
      ),
    );
  }
}
