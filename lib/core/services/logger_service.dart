import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerService {
  static final LoggerService _instance = LoggerService._internal();
  late final Logger _logger;

  factory LoggerService() => _instance;

  LoggerService._internal() {
    _logger = kDebugMode
        ? Logger(level: Level.debug)
        : Logger(level: Level.off);
  }

  void d(dynamic message) => _logger.d(message);
  void i(dynamic message) => _logger.i(message);
  void w(dynamic message) => _logger.w(message);
  void e(dynamic message, {dynamic error, StackTrace? stackTrace}) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }

  void t(dynamic message) => _logger.i(message);
}
