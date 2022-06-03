import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ming/common/theme.dart';

import 'common/routes.dart';
import 'di/di.dart';
import 'generated/l10n.dart';

class Ming extends StatelessWidget {
  const Ming({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      // repository di
      providers: repositoryProviers,
      child: MultiBlocProvider(
        // bloc di
        providers: blocProviders,
        // Global overlay to enable loading overlay whenever required.
        child: GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: SpinKitWave(
              color: Colors.white,
            ),
          ),
          overlayOpacity: 0.6,
          child: MaterialApp.router(
            title: "Ming",
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: lightTheme,
            darkTheme: darkTheme,
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
          ),
        ),
      ),
    );
  }
}
