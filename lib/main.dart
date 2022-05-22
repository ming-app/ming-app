import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:log/log.dart';

import 'di/di.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Log.init(firebaseEnable: !kIsWeb, verbose: false);

  // note: this can be used when testing auth emulation.
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  // chcek https://firebase.google.com/docs/crashlytics/customize-crash-reports?platform=flutter
  runZonedGuarded<Future<void>>(() async {
    // The following lines are the same as previously explained in "Handling uncaught errors"
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    Log.i("Hello Ming App!");

    runApp(const Ming());
  }, (error, stack) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    } else {
      Log.e("Error: Uncaught Error.", error, stack);
    }
  });
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
          title: "ming",
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
