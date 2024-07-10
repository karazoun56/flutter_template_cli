import 'package:stack_trace/stack_trace.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart' as logger;
// ignore: depend_on_referenced_packages
import 'package:logging/logging.dart';

part 'logging.dart';
part 'printer_logger.dart';

final printer = logger.Logger(printer: LoggerLogging());

logger.Logger customPrinter(String emoji) => logger.Logger(printer: CustomLogger(emoji));
