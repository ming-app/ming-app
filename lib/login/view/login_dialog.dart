import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:ming/login/cubit/login_cubit.dart';

import '../../generated/l10n.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      insetPadding: EdgeInsets.all(15),
      content: LoginPopupForm(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}

class LoginPopupForm extends StatelessWidget {
  const LoginPopupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          SystemNavigator.pop();
        } else if (state is LoginFailed) {
          // todo: make proper error page.
          context.go("error/");
        }
      },
      child: Column(
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
                child: LoginButton(
                  LoginMethod.kakao,
                  onClick: () async {
                    context.read<LoginCubit>().loginUsingKakaoRestApi();
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: LoginButton(LoginMethod.facebook),
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                child: LoginButton(
                  LoginMethod.google,
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
      ),
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
