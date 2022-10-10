import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming/shelters/model/shelter_overview_info.dart';
import 'package:ming_api/repository/api_repository.dart';

import '../model/pet_profile.dart';

part 'pet_profile_event.dart';
part 'pet_profile_state.dart';

class PetProfileBloc extends Bloc<PetProfileEvent, PetProfileState> {
  final MingApiRepository _api;

  PetProfileBloc(
    this._api,
  ) : super(PetProfileInitial()) {
    on<PetProfileFetch>(_onPetProfileFetch);
  }

  void _onPetProfileFetch(
    PetProfileFetch event,
    Emitter<PetProfileState> emit,
  ) async {
    emit(PetProfileOnLoading());

    try {
      var response = await _api.client.getAnimalDetail(event.petId);

      var profile = PetProfile.fromAnimalDetailResponse(response.result!);
      var shelter =
          ShelterOverviewInfo.fromShelterInfoResponse(response.result!.shelter);

      emit(PetProfileFetched(profile, shelter));
    } catch (e) {
      Log.e("Error on fetching animal profile.", e);
      emit(PetProfileError());
    }
  }
}
