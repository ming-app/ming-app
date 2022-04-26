import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ming/di/di.dart';

import 'generated/l10n.dart';
import 'routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // todo: add firebase setting for crashlytics and auth., analytics, etc.
  runApp(const Ming());
}

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
        child: MaterialApp(
          title: "Ming",
          // for string resource localization
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          // todo: make own theme for app
          theme: ThemeData(),

          // for named routing pages
          initialRoute: '/',
          routes: routes,
        ),
      ),
    );
  }
}
