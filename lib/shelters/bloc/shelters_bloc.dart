import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming_api/ming_api.dart';

part 'shelters_event.dart';
part 'shelters_state.dart';

class SheltersBloc extends Bloc<SheltersEvent, SheltersState> {
  final AuthenticationRepository _auth;
  final MingApiRepository _api;

  SheltersBloc(this._auth, this._api) : super(SheltersUninitialized()) {
    on<SheltersFetch>(_onSheltersFetch);
  }

  void _onSheltersFetch(
    SheltersFetch event,
    Emitter<SheltersState> emit,
  ) async {
    // todo: auth shelter인지 전체인지 구분하는 작업 api에서 필요
    try {
      var shelters = await _api.getAuthorizedShelters(await _auth.idToken);
      // todo: implement infinte scrolling.
      emit(SheltersLoaded(shelters, event.onlyAuthenticated, false));
    } catch (e) {
      Log.e("Error on fetching shelters", e);
      emit(SheltersError("$e"));
    }
  }
}
