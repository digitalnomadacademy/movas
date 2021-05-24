import 'package:simple_logger/simple_logger.dart';



final movasLogger = SimpleLogger()
  ..setLevel(Level.INFO, includeCallerInfo: true)
  ..mode = LoggerMode.log;
