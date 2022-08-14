import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';

import '../../common/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final MingAuth _auth;

  LoginCubit(this._auth) : super(LoginInitial());

  void loginUsingKakaoRestApi() async {
    emit(LoginStart());

    try {
      await _auth.loginUsingKakao(kakaoRestApiAppKey);
      emit(LoginSucess());
    } catch (e) {
      Log.e("Login using kakao rest api failed", e);
      emit(LoginFailed("Login failed"));
    }
  }
}
