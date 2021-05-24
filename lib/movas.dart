library movas;

import 'package:movas/helper/logger.dart';
import 'package:rxdart/rxdart.dart';

export 'provider/provider.dart';
export 'router/router.dart';
export 'package:rxdart/rxdart.dart';
export 'package:rxdart/streams.dart';
export 'package:rxdart/subjects.dart';

class Movas {
  static const int transitionDurationInMilliseconds = 500;

  static void log(dynamic message) {
    movasLogger.info(message);
  }
}
