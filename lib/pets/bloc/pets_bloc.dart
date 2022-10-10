import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming/pets/model/pet_overview_info.dart';
import 'package:ming_api/ming_api.dart';

part 'pets_event.dart';
part 'pets_state.dart';

class PetsBloc extends Bloc<PetsEvent, PetsState> {
  final MingApiRepository _api;

  PetsBloc(this._api) : super(PetsInitial()) {
    on<FetchPetsList>(_onFetchPetsList);
  }

  void _onFetchPetsList(
    FetchPetsList event,
    Emitter<PetsState> emit,
  ) async {
    emit(PetsListOnLoading());

    try {
      var response = await _api.client.getAnimalInShelter(
        event.shelterId,
        page: event.pageNumber,
        size: event.pageSize,
      );

      if (response.result == null) throw Exception("Null on response.result.");

      emit(PetsListFetched(
        shelterId: event.shelterId,
        pageSize: response.result!.size,
        pageNumber: response.result!.number,
        totalPageNumaber: response.result!.totalPages,
        pets: response.result!.content
            .map((e) => PetOverviewInfo.fromAnimalOverviewResponse(e))
            .toList(),
      ));
    } catch (e) {
      Log.e(
          "Error on fetching pets list for shelter id ${event.shelterId}, page size: ${event.pageSize}, page number: ${event.pageNumber}",
          e);
      emit(PetsListFetchError());
    }
  }
}
