import 'package:movas/router/router.dart';
import 'package:movas_example/movas/ui/pages/home/home_page.dart';

var router = Router(
  initialRoute: RouteName.home,
  useDemo: false,
  routes: {
    RouteName.home: (context) => HomePage(),
  },
  demoRoutes: {},
);

class RouteName {
  static const String home = "home";
}

class DemoRouteName {
  static const String demo = "demo";
}
