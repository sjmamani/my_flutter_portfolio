import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/screens/contact-me/contact_me.dart';
import 'package:my_flutter_portfolio/screens/home/components/jumbotron.dart';
import 'package:my_flutter_portfolio/screens/projects/projects.dart';

const String routeHome = '/';
const String routeMyProjects = '/my-projects';
const String routeContactMe = '/contact-me';

final navKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return MaterialPageRoute(
          builder: (_) => const Jumbotron(),
          settings: settings,
        );
        break;
      case routeMyProjects:
        return MaterialPageRoute(
          builder: (_) => const Projects(),
          settings: settings,
        );
        break;
      case routeContactMe:
        return MaterialPageRoute(
          builder: (_) => const ContactMe(),
          settings: settings,
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (_) => const Jumbotron(),
          settings: settings,
        );
    }
  }
}
