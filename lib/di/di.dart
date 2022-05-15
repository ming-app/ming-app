import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feed/feed.dart';
import '../login/login.dart';
import '../sign_up/sign_up.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<PetFeedBloc>(
    create: (context) => PetFeedBloc(
      petRepository: context.read<PetRepository>(),
    ),
  ),
  BlocProvider<SignUpCubit>(
    create: (context) => SignUpCubit(context.read<AuthenticationRepository>()),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
  ),
];

List<RepositoryProvider> repositoryProviers = [
  RepositoryProvider<PetRepository>(create: (context) => petRepository),
  RepositoryProvider<AuthenticationRepository>(
      create: (context) => AuthenticationRepository()),
];
