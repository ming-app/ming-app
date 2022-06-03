import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming_api/ming_api.dart';

import '../../common/constants.dart';
import '../../common/ui/error_page.dart';
import '../shelters.dart';

class SheltersPage extends StatelessWidget {
  const SheltersPage({Key? key, this.onlyAuthenticated = false})
      : super(key: key);
  final bool onlyAuthenticated;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(onlyAuthenticated ? "My shelters page" : "Shelters page"),
      ),
      body: SheltersForm(
        onlyAuthenticated: onlyAuthenticated,
      ),
    );
  }
}

class SheltersForm extends StatelessWidget {
  const SheltersForm({Key? key, this.onlyAuthenticated = false})
      : super(key: key);
  final bool onlyAuthenticated;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        final bloc = context.read<SheltersBloc>()
          ..add(SheltersFetch(onlyAuthenticated: onlyAuthenticated));
        return bloc.stream.firstWhere((element) => element is SheltersLoaded);
      },
      child: BlocBuilder<SheltersBloc, SheltersState>(
        builder: (context, state) {
          if (state is SheltersError) {
            return ErrorPage(message: state.message);
          } else if (state is SheltersLoaded) {
            if (state.shelters.isEmpty) {
              return const Text("등록된 쉼터가 음슴니다");
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return SheltersListItem(state.shelters[index]);
              },
              itemCount: state.shelters.length,
            );
          } else {
            return spinLoader;
          }
        },
      ),
    );
  }
}

class SheltersListItem extends StatelessWidget {
  final Shelter shelter;
  const SheltersListItem(this.shelter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("id: ${shelter.id}"),
          Text(shelter.name),
          Text(shelter.introduction ?? "no intro"),
          Text(shelter.phoneNumber ?? "no phone number"),
          Text(shelter.snsUrl ?? "no sns url"),
        ],
      ),
    );
  }
}
