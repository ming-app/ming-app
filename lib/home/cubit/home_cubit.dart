import 'package:bloc/bloc.dart';
import 'package:log/log.dart';
import 'package:meta/meta.dart';
import 'package:ming/home/model/regional_info.dart';
import 'package:ming_api/ming_api.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MingApiRepository _apiRepository;

  HomeCubit(this._apiRepository) : super(HomeInitial()) {
    fetchOverview();
  }

  void fetchOverview() async {
    var response = await _apiRepository.client.getSheltersRegionalInfo();

    Log.i("response = $response");

    var regions =
        response.result?.map((e) => RegionalInfo.fromOverview(e)).toList() ??
            [];

    emit(HomeFetched(regions));
  }
}
