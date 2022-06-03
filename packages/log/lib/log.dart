// ignore_for_file: avoid_print

library log;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:loggy/loggy.dart';

class Log {
  static void init({bool firebaseEnable = true, bool verbose = false}) {
    Loggy.initLoggy(
      logPrinter: _MultiPrinter(
        printers: firebaseEnable
            ? [
                _CustomPrinter(),
                _FirebasePrinter(),
                const PrettyDeveloperPrinter()
              ]
            : [_CustomPrinter(), const PrettyDeveloperPrinter()],
      ),
      logOptions: LogOptions(
        kDebugMode ? (verbose ? LogLevel.all : LogLevel.debug) : LogLevel.info,
        stackTraceLevel: LogLevel.off,
        includeCallerInfo: true,
        callerFrameDepthLevel: 3,
      ),
    );
  }

  static final d = logDebug;
  static final e = logError;
  static final w = logWarning;
  static final i = logInfo;

  static final dioInterceptor = LoggyDioInterceptor();
}

String _logFormat(LogRecord record) {
  const levelPrefixes = {
    LogLevel.debug: "[D]",
    LogLevel.info: "[I]",
    LogLevel.warning: "[W]",
    LogLevel.error: "[E]",
  };

  final time = record.time.toIso8601String().split('T')[1];
  final prefix = levelPrefixes[record.level] ?? "[N]";

  return "$time: $prefix ${record.callerFrame}: ${record.message}";
}

class _CustomPrinter extends LoggyPrinter {
  static final _levelColors = {
    LogLevel.debug:
        AnsiColor(foregroundColor: AnsiColor.grey(0.5), italic: true),
    LogLevel.info: AnsiColor(foregroundColor: 35),
    LogLevel.warning: AnsiColor(foregroundColor: 214),
    LogLevel.error: AnsiColor(foregroundColor: 196),
  };

  _CustomPrinter() : super();

  @override
  void onLog(LogRecord record) {
    final color = _levelColor(record.level) ?? AnsiColor();

    print(color(_logFormat(record)));

    if (record.error != null) {
      print(record.error);
    }

    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  }

  AnsiColor? _levelColor(LogLevel level) {
    return _levelColors[level];
  }
}

class _FirebasePrinter extends LoggyPrinter {
  _FirebasePrinter() : super();

  @override
  void onLog(LogRecord record) {
    FirebaseCrashlytics.instance.log(_logFormat(record));
    if (record.error != null) {
      FirebaseCrashlytics.instance.log(record.error.toString());
    }

    if (record.stackTrace != null) {
      FirebaseCrashlytics.instance.log(record.stackTrace.toString());
    }
  }
}

class _MultiPrinter extends LoggyPrinter {
  final List<LoggyPrinter> printers;

  _MultiPrinter({
    required this.printers,
  });

  @override
  void onLog(LogRecord record) {
    for (var printer in printers) {
      printer.onLog(record);
    }
  }
}
