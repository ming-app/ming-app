import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/pet_feed_bloc.dart';

import '../models/pet.dart';
import '../../generated/l10n.dart';

class PetFeedItem extends StatelessWidget {
  final Pet pet;

  const PetFeedItem({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Column(
        children: [
          Text(pet.name),
          Text(pet.birth),
          ExtendedImage.network(pet.imageUrls[0]),
        ],
      ),
    );
  }
}

class PetFeedListView extends StatelessWidget {
  const PetFeedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetFeedBloc, PetFeedState>(
      builder: (context, state) {
        if (state is PetFeedInitial) {
          return Text(S.of(context).initialStateTryClickRefreshButton);
        } else if (state is PetFeedFetched) {
          return ListView.builder(
            itemCount: state.pets.length,
            itemBuilder: (context, index) {
              return PetFeedItem(pet: state.pets[index]);
            },
          );
        } else {
          return const Text("ERROR");
        }
      },
    );
  }
}

class PetFeedPage extends StatelessWidget {
  const PetFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: PetFeedListView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PetFeedBloc>().add(PetFeedFetch()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
