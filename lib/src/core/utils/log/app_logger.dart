import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

Logger logger =
    Logger(printer: PrettyPrinter(levelColors: {Level.debug: AnsiColor.fg(199)}));

void initRootLogger() {
  // only enable logging for debug mode
  if (kDebugMode) {
    Logger.level = Level.all;
  } else {
    Logger.level = Level.off;
  }
  // hierarchicalLoggingEnabled = true;

  Logger.addLogListener((record) {
    if (!kDebugMode) {
      return;
    }

    var start = '\x1b[90m';
    const end = '\x1b[0m';
    // const white = '\x1b[37m';

    switch (record.level.name) {
      case 'INFO':
        start = '\x1b[92m';
        break;
      case 'WARNING':
        start = '\x1b[93m';
        break;
      case 'SEVERE':
        start = '\x1b[103m\x1b[31m';
        break;
      case 'SHOUT':
        start = '\x1b[41m\x1b[93m';
        break;
    }

    final message = '$end$start${record.message}$end';
    /*developer.log(
      message,
      // name: record.loggerName.padRight(25),
      level: record.level.value,
    );*/
  });
}
