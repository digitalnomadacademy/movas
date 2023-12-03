import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

void moveAss(Widget app) {
  Provider.debugCheckInvalidValueType = null;

  runApp(app);
}
