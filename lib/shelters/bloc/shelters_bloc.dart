import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming/shelters/model/shelters_info.dart';
import 'package:ming_api/ming_api.dart';

part 'shelters_event.dart';
part 'shelters_state.dart';

class SheltersBloc extends Bloc<SheltersEvent, SheltersState> {
  final MingApiRepository _api;

  SheltersBloc(this._api) : super(SheltersUninitialized()) {
    on<SheltersFetch>(_onSheltersFetch);
  }

  void _onSheltersFetch(
    SheltersFetch event,
    Emitter<SheltersState> emit,
  ) async {
    emit(SheltersOnLoading());

    try {
      late SheltersInfo info;

      var regions = (await _api.client.getSheltersRegionalInfo()).result!;
      var shelters = (await _api.client.getShelters(regionId: event.regionId))
              .result
              ?.content ??
          [];

      if (event.regionId != null) {
        var region = regions
            .where((element) => element.region.id == event.regionId)
            .first;
        info = SheltersInfo.fromShelterByRegionRespnose(region, shelters);
      } else {
        info = SheltersInfo.fromOverallResponse(regions, shelters);
      }

      // todo: implement infinte scrolling.
      emit(
        SheltersLoaded(info, false),
      );
    } catch (e) {
      Log.e("Error on fetching shelters", e);
      emit(SheltersError("$e"));
    }
  }
}
