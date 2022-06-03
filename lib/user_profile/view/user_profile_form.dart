import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming_api/ming_api.dart';

import '../user_profile.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm(this.user, {Key? key}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Row(
              children: [
                const Text("User Id: "),
                Text(user.uid),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text("Email: "),
                Text(user.email),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text("Name: "),
                Expanded(
                  child: TextFormField(
                    initialValue: user.name,
                    key: Key(state.key ?? "UserProfile_Name_TextFormField"),
                    onChanged: (name) =>
                        context.read<UserProfileCubit>().nameChanged(name),
                  ),
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Text("SNS Url: "),
                Expanded(
                  child: TextFormField(
                    initialValue: user.snsUrl,
                    key: Key(state.key ?? "UserProfile_SnsUrl_TextFormField"),
                    onChanged: (url) =>
                        context.read<UserProfileCubit>().snsUrlChanged(url),
                  ),
                ),
              ],
            ),
            state is UserProfileEditing
                ? Row(
                    children: [
                      ElevatedButton(
                        onPressed: () => context
                            .read<UserProfileCubit>()
                            .updateUserProfile(state.user),
                        child: const Text("Update"),
                      ),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<UserProfileCubit>().cancelEditing(),
                        child: const Text("Cancel"),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      );
    });
  }
}
