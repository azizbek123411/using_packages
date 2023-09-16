import 'package:logger/logger.dart';

class LogService {
  static final Logger log = Logger(
    filter: DevelopmentFilter(),
    printer: PrettyPrinter(),
  );

  static void d(String message) {
    log.d(message);
  }

  static void i(String message) {
    log.i(message);
  }

  static void w(String message) {
    log.w(message);
  }

  static void e(String message) {
    log.e(message);
  }
}
