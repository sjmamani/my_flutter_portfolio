import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/screens/contact-me/contact_me.dart';
import 'package:my_flutter_portfolio/screens/home/components/jumbotron.dart';
import 'package:my_flutter_portfolio/screens/projects/projects.dart';
import 'package:page_transition/page_transition.dart';

const String routeHome = '/';
const String routeMyProjects = '/my-projects';
const String routeContactMe = '/contact-me';

final navKey = GlobalKey<NavigatorState>();

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeHome:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 150),
          child: const Jumbotron(),
          settings: settings,
        );
        break;
      case routeMyProjects:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 150),
          child: const Projects(),
          settings: settings,
        );
        break;
      case routeContactMe:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 150),
          child: const ContactMe(),
          settings: settings,
        );
        break;
      default:
        return PageTransition(
          type: PageTransitionType.bottomToTop,
          duration: const Duration(milliseconds: 150),
          child: const Jumbotron(),
          settings: settings,
        );
    }
  }
}
