import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming_api/model/model.dart';
import 'package:ming_api/repository/ming_api_repository.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(
    this._auth,
    this._api,
  ) : super(UserProfileInitial());

  final AuthenticationRepository _auth;
  final MingApiRepository _api;

  Future<void> getUserProfile() async {
    try {
      final token = await _auth.idToken;
      final user = await _api.getUserInfo(token);
      Log.d('User profile fetched');
      emit(UserProfileFetched(user));
    } catch (e) {
      Log.e('user profile fetch failed', e);
      emit(UserProfileError("$e"));
    }
  }
}
