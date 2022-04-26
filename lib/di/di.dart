import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/adapters/fake_pet_repository.dart';
import 'package:ming/blocs/bloc/pet_feed_bloc.dart';
import 'package:ming/models/pet_repository.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<PetFeedBloc>(
    create: (context) => PetFeedBloc(
      petRepository: context.read<PetRepository>(),
    ),
  ),
];

List<RepositoryProvider> repositoryProviers = [
  // todo: change fake repository to actual implementation
  RepositoryProvider<PetRepository>(create: (context) => FakePetRepository()),
];
