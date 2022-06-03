import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming_api/repository/ming_api_repository.dart';

import '../auth/bloc/auth_bloc.dart';
import '../common/constants.dart';
import '../feed/feed.dart';
import '../login/login.dart';
import '../shelters/bloc/shelters_bloc.dart';
import '../sign_up/sign_up.dart';
import '../user_profile/cubit/user_profile_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<PetFeedBloc>(
    create: (context) => PetFeedBloc(
      petRepository: context.read<PetRepository>(),
    ),
  ),
  BlocProvider<SignUpCubit>(
    create: (context) => SignUpCubit(
      context.read<AuthenticationRepository>(),
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(context.read<AuthenticationRepository>()),
  ),
  BlocProvider<AuthBloc>(
    create: (context) =>
        AuthBloc(repository: context.read<AuthenticationRepository>()),
  ),
  BlocProvider<UserProfileCubit>(
    create: (context) => UserProfileCubit(
      context.read<AuthenticationRepository>(),
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<SheltersBloc>(
    create: (context) => SheltersBloc(
      context.read<AuthenticationRepository>(),
      context.read<MingApiRepository>(),
    ),
  )
];

List<RepositoryProvider> repositoryProviers = [
  RepositoryProvider<PetRepository>(create: (context) => petRepository),
  RepositoryProvider<AuthenticationRepository>(
      create: (context) => AuthenticationRepository()),
  RepositoryProvider<MingApiRepository>(
      create: (context) => MingApiRepository(
            baseUrl: mingServerUrl,
            logging: kDebugMode ? true : false, // logging if debug mode
          )),
];
