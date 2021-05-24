import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void moveAss(Widget app) {
  Provider.debugCheckInvalidValueType = <T>(T value) {
    assert(() {
      return true;
    }());
  };

  runApp(app);
}
