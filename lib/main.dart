import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'di/di.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // note: this can be used when testing auth emulation.
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

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
          initialRoute: kDebugMode ? '/debug_root' : '/feed',
          routes: routes,
        ),
      ),
    );
  }
}
