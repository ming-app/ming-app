import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:log/log.dart';

import 'firebase_options.dart';
import 'ming.dart';

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
    usePathUrlStrategy();
    runApp(const Ming());
  }, (error, stack) {
    if (!kIsWeb) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    } else {
      Log.e("Error: Uncaught Error.", error, stack);
    }
  });
}
