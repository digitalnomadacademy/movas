import 'package:flutter/material.dart';
import 'package:movas/config/config.dart';
import 'package:movas_example/movas/provider/provider.dart';
import 'package:movas_example/movas/router/router.dart';
import 'package:provider/provider.dart';

void main() {
  moveAss(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'MOVAS Framework Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: router.initialRoute,
        routes: router.calculateAllRoutes,
      ),
    );
  }
}
