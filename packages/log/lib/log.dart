// ignore_for_file: avoid_print

library log;

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy/flutter_loggy.dart';
import 'package:loggy/loggy.dart';
import 'package:stack_trace/stack_trace.dart';

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
      ),
    );
  }

  static d(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _log(message, LogLevel.debug, error, stackTrace);
  static e(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _log(message, LogLevel.error, error, stackTrace);
  static i(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _log(message, LogLevel.info, error, stackTrace);
  static w(dynamic message, [Object? error, StackTrace? stackTrace]) =>
      _log(message, LogLevel.warning, error, stackTrace);

  static _log(dynamic message, LogLevel level,
      [Object? error, StackTrace? stackTrace]) {
    var prefix = "";

    if (true) {
      var debug = Trace.current();
      var member = Trace.current().frames[2].member!.split(".");

      // if there are no corresponding class, then class name will be ""
      var className = member.length == 2 ? member[1] : "";
      var methodName = member[0];
      prefix = "$className/$methodName: ";
    }

    switch (level) {
      case LogLevel.debug:
        logDebug("$prefix$message", error, stackTrace);
        break;
      case LogLevel.error:
        logError("$prefix$message", error, stackTrace);
        break;
      case LogLevel.info:
        logInfo("$prefix$message", error, stackTrace);
        break;
      case LogLevel.warning:
        logWarning("$prefix$message", error, stackTrace);
        break;
      default:
        break;
    }
  }
}

String _logFormat(LogRecord record) {
  const levelPrefixes = {
    LogLevel.debug: "[D]",
    LogLevel.info: "[I]",
    LogLevel.warning: "[W]",
    LogLevel.error: "[E]",
  };

  final time = record.time.toIso8601String().split('T')[1];
  final prefix = levelPrefixes[record.level] ?? "N";

  return "$time: $prefix ${record.message}";
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
