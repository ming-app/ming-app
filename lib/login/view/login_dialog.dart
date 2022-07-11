import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/login/login.dart';

import '../../generated/l10n.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                    state.errorMessage ?? S.of(context).loginFailedMessage),
              ),
            );

          Navigator.pop(context);
        } else if (state.status.isSubmissionSuccess) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(S.of(context).loginSuccessMessage),
              ),
            );
          Navigator.pop(context);
        } else if (state.status.isSubmissionInProgress) {
          context.loaderOverlay.show();
        } else {
          context.loaderOverlay.hide();
        }
      },
      child: const AlertDialog(
        insetPadding: EdgeInsets.all(15),
        content: LoginPopupForm(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
    );
  }
}

class LoginPopupForm extends StatelessWidget {
  const LoginPopupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).loginTitle,
              style: theme.textTheme.titleMedium,
            ),
            Text(
              S.of(context).loginGuide1,
              style: theme.textTheme.caption,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: LoginButton(LoginMethod.kakao),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: LoginButton(LoginMethod.facebook),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: LoginButton(
                    LoginMethod.google,
                    onClick: () => context.read<LoginCubit>().logInWithGoogle(),
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              S.of(context).loginGuide2,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        );
      },
    );
  }
}

enum LoginMethod {
  google("assets/google_icon.png", Colors.black, Colors.white),
  facebook("assets/facebook_icon.png", Colors.white, Color(0xff4267b2)),
  kakao("kakao_icon.png", Colors.black, Color(0xffffe812)),
  ;

  final String asset;
  final Color bgColor;
  final Color color;

  const LoginMethod(this.asset, this.color, this.bgColor);
}

class LoginButton extends StatelessWidget {
  final LoginMethod method;
  final void Function()? onClick;

  const LoginButton(this.method, {this.onClick, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String label;

    switch (method) {
      case LoginMethod.google:
        label = S.of(context).google;
        break;
      case LoginMethod.facebook:
        label = S.of(context).facebook;
        break;
      case LoginMethod.kakao:
        label = S.of(context).kakao;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        color: method.bgColor,
        borderRadius: BorderRadius.circular(10),
        border: method == LoginMethod.google
            ? Border.all(color: Colors.black26)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: TextButton.icon(
          onPressed: onClick,
          icon: SizedBox(
            child: Image.asset(method.asset),
            height: 25,
          ),
          label: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .button!
                .copyWith(color: method.color),
          ),
        ),
      ),
    );
  }
}
