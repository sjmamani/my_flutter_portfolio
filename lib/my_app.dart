import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_portfolio/responsive.dart';
import 'package:my_flutter_portfolio/screens/home/home.dart';
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
        textTheme: GoogleFonts.robotoSlabTextTheme(Theme.of(context).textTheme),
      ),
      // builder: (_, child) => HomeScreenWeb(
      //   child: child,
      // ), O ES HOME o ES BUILDER. Con Builder anda la web y con home anda el mobile
      home: const HomeScreenWeb(),
      initialRoute: routeHome,
      navigatorKey: navKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
