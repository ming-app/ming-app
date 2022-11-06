import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileContents(user),
            SizedBox(
              width: 50,
            ),
            SwitchToAdminButton(),
          ],
        ),
      );
    });
  }
}

class UserProfileContents extends StatelessWidget {
  final UserProfile user;

  const UserProfileContents(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
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
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).gender,
              content: user.gender?.toString() ?? "없음",
              desc: "정확한 성별을 입력해 주세요.",
              fieldTitle: S.of(context).gender,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).birthday,
              content: user.birthday ?? "없음",
              desc: "정확한 생년월일을 입력해 주세요.",
              fieldTitle: S.of(context).birthday,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).email,
              content: user.email,
              desc: "이메일을 정확히 입력해 주세요.",
              fieldTitle: S.of(context).email,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).phoneNumber,
              content: user.phoneNumber ?? "없음",
              desc: "전화번호를 정확히 기입해 주세요.",
              fieldTitle: S.of(context).phoneNumber,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).selfIntroduction,
              content: user.introduction ?? "없음",
              desc: "자유롭게 자기소개를 작성해 주세요.",
              fieldTitle: S.of(context).selfIntroduction,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).address,
              content: user.address ?? "없음",
              desc: "주소를 입력해 주세요.",
              fieldTitle: S.of(context).address,
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            CustomEditableField(
              title: S.of(context).instagram,
              content: user.snsUrl ?? "없음",
              desc: "인스타그램을 입력해 주세요.",
              fieldTitle: S.of(context).instagram,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[200],
                foregroundColor: Colors.black,
                fixedSize: Size(167, 44),
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
