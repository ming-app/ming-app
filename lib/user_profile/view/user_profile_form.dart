import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/common/adaptive_builder.dart';
import 'package:ming/common/ming_icons.dart';
import 'package:ming/common/ui/custom_editable_field.dart';

import '../../generated/l10n.dart';
import '../model/user.dart';
import '../user_profile.dart';

class UserProfileForm extends StatelessWidget {
  const UserProfileForm(this.user, {Key? key}) : super(key: key);

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
      UserProfileEditingType type = UserProfileEditingType.none;

      if (state is UserProfileEditing) {
        type = state.type;
      }

      return AdaptiveBuilder(
          mobile: UserProfileMobileForm(
            type: type,
            user: user,
          ),
          desktop: UserProfileDesktopForm(
            type: type,
            user: user,
          ));
    });
  }
}

class UserProfileMobileForm extends StatelessWidget {
  final UserProfileEditingType type;
  final UserProfile user;
  const UserProfileMobileForm({
    Key? key,
    required this.type,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                  child: IconButton(
                    iconSize: 24,
                    onPressed: () {
                      // todo: make share link
                    },
                    icon: Icon(MingIcons.upload),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              user.name,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            UserProfileContents(user, type),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 0),
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  padding: EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: null, // todo
              child: Text(
                S.of(context).switchToAdmin,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                surfaceTintColor: Colors.white,
                side: BorderSide(width: 1.0, color: Color(0xffc8c8c8)),
                minimumSize: Size(double.infinity, 0),
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 18,
                ),
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: (() {
                context.read<UserProfileCubit>().logout();
              }),
              child: Text("로그아웃"),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}

class UserProfileDesktopForm extends StatelessWidget {
  final UserProfileEditingType type;
  final UserProfile user;

  const UserProfileDesktopForm({
    Key? key,
    required this.type,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(user.imageUrl),
                  ),
                  SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(user.name),
                      Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          // todo: make share link
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        icon: Icon(
                          Icons.launch,
                          size: 18,
                        ),
                        label: Text(S.of(context).share),
                      ),
                    ],
                  ),
                  UserProfileContents(user, type),
                  SizedBox(height: 32),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      foregroundColor: Colors.black,
                      fixedSize: Size(167, 44),
                      textStyle:
                          Theme.of(context).textTheme.bodySmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: (() {
                      context.read<UserProfileCubit>().logout();
                    }),
                    child: Text("로그아웃"),
                  ),
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50,
          ),
          SwitchToAdminButton(),
        ],
      ),
    );
  }
}

class UserProfileContents extends StatelessWidget {
  final UserProfileEditingType editingType;
  final UserProfile user;

  const UserProfileContents(this.user, this.editingType, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Divider(),
        SizedBox(height: 40),
        Column(
          children: [
            Text(
              S.of(context).profile,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: (15 * S.of(context).profile.length).toDouble(),
              height: 2,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).nickName,
          content: user.name,
          desc: S.of(context).nicknameDesc,
          fieldTitle: S.of(context).nickName,
          greyed: editingType != UserProfileEditingType.none,
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).gender,
          content: user.gender?.toString() ?? "없음",
          desc: "정확한 성별을 입력해 주세요.",
          fieldTitle: S.of(context).gender,
          greyed: editingType != UserProfileEditingType.none, // todo
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).birthday,
          content: user.birthday ?? "없음",
          desc: "정확한 생년월일을 입력해 주세요.",
          fieldTitle: S.of(context).birthday,
          greyed: editingType != UserProfileEditingType.none, // todo
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).email,
          content: user.email,
          desc: "이메일을 정확히 입력해 주세요.",
          fieldTitle: S.of(context).email,
          greyed: editingType != UserProfileEditingType.none,
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).phoneNumber,
          content: user.phoneNumber ?? "없음",
          desc: "전화번호를 정확히 기입해 주세요.",
          fieldTitle: S.of(context).phoneNumber,
          greyed: editingType != UserProfileEditingType.none, // todo
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).selfIntroduction,
          content: user.introduction ?? "없음",
          desc: "자유롭게 자기소개를 작성해 주세요.",
          fieldTitle: S.of(context).selfIntroduction,
          onEditStateChange: (editState) {
            context.read<UserProfileCubit>().onEditStateChange(
                  editState
                      ? UserProfileEditingType.introduction
                      : UserProfileEditingType.none,
                );
          },
          onSaved: (newValue) {
            context.read<UserProfileCubit>().updateUserProfile(
                  introduction: newValue,
                );
          },
          greyed: editingType != UserProfileEditingType.none &&
              editingType != UserProfileEditingType.introduction,
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).address,
          content: user.address ?? "없음",
          desc: "주소를 입력해 주세요.",
          fieldTitle: S.of(context).address,
          onEditStateChange: (editState) {
            context.read<UserProfileCubit>().onEditStateChange(
                  editState
                      ? UserProfileEditingType.address
                      : UserProfileEditingType.none,
                );
          },
          onSaved: (newValue) {
            context.read<UserProfileCubit>().updateUserProfile(
                  address: newValue,
                );
          },
          greyed: editingType != UserProfileEditingType.none &&
              editingType != UserProfileEditingType.address,
        ),
        SizedBox(height: 20),
        Divider(),
        SizedBox(height: 20),
        CustomEditableField(
          title: S.of(context).instagram,
          content: user.snsUrl ?? "없음",
          desc: "인스타그램을 입력해 주세요.",
          fieldTitle: S.of(context).instagram,
          onEditStateChange: (editState) {
            context.read<UserProfileCubit>().onEditStateChange(
                  editState
                      ? UserProfileEditingType.snsUrl
                      : UserProfileEditingType.none,
                );
          },
          onSaved: (newValue) {
            context.read<UserProfileCubit>().updateUserProfile(
                  snsUrl: newValue,
                );
          },
          greyed: editingType != UserProfileEditingType.none &&
              editingType != UserProfileEditingType.snsUrl,
        ),
      ],
    );
  }
}

class SwitchToAdminButton extends StatelessWidget {
  final Function()? onClick;

  const SwitchToAdminButton({
    Key? key,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 300,
        ),
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).transfromToShelterAccount),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 0),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      padding: EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: onClick,
                  child: Text(
                    S.of(context).transform,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
