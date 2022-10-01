import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/pets/bloc/pets_bloc.dart';
import 'package:ming/pets/view/pets_form.dart';

import '../../common/ui/error_page.dart';

class PetsView extends StatelessWidget {
  final String shelterId;

  const PetsView(
    this.shelterId, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget _fetchAndReturnEmpty() {
      context.read<PetsBloc>().add(FetchPetsList(shelterId));
      return Container();
    }

    return BlocBuilder<PetsBloc, PetsState>(
      builder: (context, state) {
        if (state is PetsInitial) {
          return _fetchAndReturnEmpty();
        } else if (state is PetsListFetched) {
          if (state.shelterId != shelterId) {
            return _fetchAndReturnEmpty();
          }

          return PetsForm(
            shelterId: state.shelterId,
            pets: state.pets,
            pageSize: state.pageSize,
            pageNumber: state.pageNumber,
            totalPageNumaber: state.totalPageNumaber,
          );
        } else if (state is PetsListOnLoading) {
          return Container();
        } else if (state is PetsListFetchError) {
          return const ErrorPage(
            message: "동물 리스트를 가져오는 데에 실패하였습니다.",
          );
        }

        return const ErrorPage(
          message: "알수 없는 에러가 발생하였습니다.",
        );
      },
    );
  }
}
