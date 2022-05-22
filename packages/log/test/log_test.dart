import 'package:flutter_test/flutter_test.dart';

import 'package:log/log.dart';
import 'package:stack_trace/stack_trace.dart';

void main() {
  test('Test Logging', () {
    Log.init(firebaseEnable: false);

    Log.d("Debug Test");
    Log.e("Error Test");
    Log.e("Error test with stack trace", Trace.current());
    Log.e("Error test with error and stacktrace", Exception("test exception"),
        Trace.current());
    Log.e("Error test with only exception", Exception("test exception"));
    Log.i("Info Test");
    Log.w("Warning test");
  });
}
