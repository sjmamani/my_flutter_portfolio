import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/screens/home/home_web.dart';

import 'constants.dart';
import 'routes_generator.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Santiago Mamani | Portfolio',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
      ),
      builder: (_, child) => HomeScreenWeb(
        child: child,
      ),
      initialRoute: routeHome,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
