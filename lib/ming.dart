import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    );
  }
}

// MaterialApp(
//           title: "ming",
//           // for string resource localization
//           localizationsDelegates: const [
//             S.delegate,
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           supportedLocales: S.delegate.supportedLocales,
//           // todo: make own theme for app
//           theme: lightTheme,
//           darkTheme: darkTheme,
//           // for named routing pages
//           initialRoute: kDebugMode ? '/debug_root' : '/feed',
//           routes: routes,
//         ),
