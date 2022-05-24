import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository _repository;
  bool _isInitialized = false;

  AuthBloc({required AuthenticationRepository repository})
      : _repository = repository,
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
    repository.logOut().then((value) => add(StartListenAuthStatus()));
  }

  Future<void> _onStartListenAuthStatus(
      AuthEvent event, Emitter<AuthState> emit) async {
    Log.d("start");

    if (_isInitialized) return;

    await emit.forEach(_repository.user, onData: (AuthInfo user) {
      if (user.isNotEmpty) {
        return Authenticated(user);
      }
      return UnAuthenticated();
    });

    _isInitialized = true;
  }

  Future<void> _onLogOut(AuthEvent event, Emitter<AuthState> emit) async {
    Log.d("start");
    await _repository.logOut();
  }
}
