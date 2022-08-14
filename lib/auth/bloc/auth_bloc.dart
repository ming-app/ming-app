import 'package:auth/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming/auth/entities/user.dart';
import 'package:ming_api/ming_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final MingAuth _auth;
  final MingApiRepository _api;
  bool _isInitialized = false;

  AuthBloc({required MingAuth auth, required MingApiRepository api})
      : _auth = auth,
        _api = api,
        super(AuthInitial()) {
    on<AuthEvent>(((event, emit) async {
      if (event is StartListenAuthStatus) {
        await _onStartListenAuthStatus(event, emit);
      } else if (event is LogOut) {
        await _onLogOut(event, emit);
      }
    }));

    // 자동로그인을 할 경우 logout 필요없이 바로 auth 진행하면 됨.
    // 현재의 경우 session이 계속 유지되기 때문에 logout을 명시 해놓음.
    // todo: 대부분 앱들이 자동 로그인을 default로 제공하는 것 같으니 그냥 유지해도 될 거 같다.
    add(StartListenAuthStatus());
  }

  Future<void> _onStartListenAuthStatus(
      AuthEvent event, Emitter<AuthState> emit) async {
    Log.d("start");

    if (_isInitialized) return;

    _auth.status.listen((status) async {
      if (status.isLogIn) {
        try {
          final response =
              await _api.client.getUserDetailInfo(withBearer(status.token));

          final userInfo =
              UserInfo.fromUserDetailInfoResponse(response.result!);

          emit(Authenticated(userInfo));

          return;
        } catch (e) {
          Log.e("Getting user detail error", e);
        }
      }

      emit(UnAuthenticated());
    }, onError: (e, stackTrace) {
      Log.e("Auth handling error.", e, stackTrace);
      emit(UnAuthenticated());
    });

    _isInitialized = true;
  }

  Future<void> _onLogOut(AuthEvent event, Emitter<AuthState> emit) async {
    Log.d("start");
    await _auth.logout();
  }
}
