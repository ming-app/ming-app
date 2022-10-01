import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming_api/ming_api.dart';

import '../model/shelter_profile.dart';

part 'shelter_profile_event.dart';
part 'shelter_profile_state.dart';

class ShelterProfileBloc
    extends Bloc<ShelterProfileEvent, ShelterProfileState> {
  final MingApiRepository _api;

  ShelterProfileBloc(this._api) : super(ShelterProfileInitial()) {
    on<ShelterProfileFetch>(_onShelterProfileFetch);
  }

  void _onShelterProfileFetch(
    ShelterProfileFetch event,
    Emitter<ShelterProfileState> emit,
  ) async {
    emit(ShelterProfileOnLoading());

    try {
      var response = await _api.client.getShelterDetail(event.shelterId);

      emit(
        ShelterProfileFetched(
          ShelterProfile.fromShelterDetailResponse(response.result!),
        ),
      );
    } catch (e) {
      Log.e("Error on fetching shelter profile.", e);
      emit(ShelterProfileError());
    }
  }
}
