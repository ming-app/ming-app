import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// test this with flutter test integration_test/
// if test is launched at ios, it will show ios platform, if android, that, if web, that.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  test("Test platform", () {
    if (Platform.isAndroid) {
      debugPrint("Platform is Android");
    } else if (Platform.isIOS) {
      debugPrint("Platform is iOS");
    } else if (kIsWeb) {
      debugPrint("Platform is Web");
    }
  });
}
