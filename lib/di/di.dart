import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ming/album/bloc/album_bloc.dart';

import 'package:ming/home/cubit/home_cubit.dart';
import 'package:ming/login/cubit/login_cubit.dart';
import 'package:ming/pet_profile/bloc/pet_profile_bloc.dart';
import 'package:ming/pets/bloc/pets_bloc.dart';
import 'package:ming/shelter_profile/bloc/shelter_profile_bloc.dart';
import 'package:ming_api/ming_api.dart';
import 'package:auth/auth.dart';

import '../auth/bloc/auth_bloc.dart';
import '../common/constants.dart';
import '../feed/feed.dart';
import '../shelters/bloc/shelters_bloc.dart';
import '../user_profile/cubit/user_profile_cubit.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<PetFeedBloc>(
    create: (context) => PetFeedBloc(
      petRepository: context.read<PetRepository>(),
    ),
  ),
  BlocProvider<AuthBloc>(
    create: (context) => AuthBloc(
      auth: context.read<MingAuth>(),
      api: context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<UserProfileCubit>(
    create: (context) => UserProfileCubit(
      context.read<MingAuth>(),
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<SheltersBloc>(
    create: (context) => SheltersBloc(
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<ShelterProfileBloc>(
    create: (context) => ShelterProfileBloc(
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<PetProfileBloc>(
    create: (context) => PetProfileBloc(
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<PetsBloc>(
    create: (context) => PetsBloc(
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<HomeCubit>(
    create: (context) => HomeCubit(context.read<MingApiRepository>()),
  ),
  BlocProvider<AlbumBloc>(
    create: (context) => AlbumBloc(
      context.read<MingApiRepository>(),
    ),
  ),
  BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(context.read<MingAuth>()),
  ),
];

// NOTE: order of list matters.
List<RepositoryProvider> repositoryProviers = [
  RepositoryProvider<PetRepository>(
    create: (context) => petRepository,
  ),
  RepositoryProvider<MingApiRepository>(
    create: (context) => MingApiRepository(
      baseUrl: mingServerUrl,
    ),
  ),
  RepositoryProvider<MingAuth>(
    create: (context) =>
        MingAuth(context.read<MingApiRepository>(), authSecureHiveKey),
  ),
];
