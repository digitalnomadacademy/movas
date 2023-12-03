import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movas/router/demo_page/demo_page.dart';

import '../movas.dart';

/// use this class to make easy distinction between test routes,
/// and demo page to check on that stuff
class Router {
  static const String demoRoute = "demo";

  final Map<String, WidgetBuilder> routes;
  final Map<String, WidgetBuilder> demoRoutes;

  final String initialRoute;
  final bool useDemo;

  Router({
    required this.routes,
    this.demoRoutes = const <String, WidgetBuilder>{},
    required this.initialRoute,
    this.useDemo = true,
  });

  Map<String, WidgetBuilder> get calculateAllRoutes =>
      {...routes, ...demoRoutes, ..._demoHome};

  String get calculateInitialRoute => useDemo ? demoRoute : initialRoute;

  Map<String, WidgetBuilder> get _demoHome => useDemo
      ? {
          demoRoute: (context) =>
              DemoPage(testRoutes: demoRoutes, routes: routes)
        }
      : {};
}

class FadeTransitionRouteBuilder extends PageRouteBuilder {
  FadeTransitionRouteBuilder(Widget page)
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return page;
          },
          transitionDuration:
              Duration(milliseconds: Movas.transitionDurationInMilliseconds),
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
}
