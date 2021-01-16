import 'package:simple_logger/simple_logger.dart';

final SimpleLogger logger = SimpleLogger()
  ..setLevel(Level.INFO, includeCallerInfo: true)
  ..mode = LoggerMode.log;
