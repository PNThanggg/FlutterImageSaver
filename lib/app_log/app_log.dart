import 'package:flutter/foundation.dart';

import 'log/logger.dart';

class AppLog {
  static Logger logger = Logger(
    printer: PrettyPrinter(),
  );

  static Logger loggerNoStack = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static debug(dynamic message) {
    if (kDebugMode) {
      logger.d(message);
    }
  }

  static info(dynamic message) {
    if (kDebugMode) {
      // logger.i(message);

      loggerNoStack.i(message);
    }
  }

  static warning(dynamic message) {
    if (kDebugMode) {
      loggerNoStack.w(message);
    }
  }

  static error(dynamic message) {
    if (kDebugMode) {
      logger.e(message, 'Error');
    }
  }

  static verbose(dynamic message) {
    if (kDebugMode) {
      logger.v(message);
    }
  }

  static logWtf(dynamic message) {
    if (kDebugMode) {
      // logger.wtf(message);

      loggerNoStack.wtf(message);
    }
  }
}
