import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/components/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';
import '../../responsive.dart';
import '../../routes_generator.dart';
import 'components/footer.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isMobile(context) ? const MyDrawer() : null,
      body: Column(
        children: [
          const Navbar(),
          Expanded(child: child),
          const Footer(),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = RootDrawer.of(context);
    return Drawer(
      child: Column(
        children: [
          NavMobileItem(
            text: 'Home',
            tapEvent: () {
              navKey.currentState.pushNamed(routeHome);
              state.close();
            },
          ),
          NavMobileItem(
            text: 'My Projects',
            tapEvent: () {
              navKey.currentState.pushNamed(routeMyProjects);
              state.close();
              // print(navKey.currentState.canPop());
            },
          ),
          NavMobileItem(
            text: 'Contact Me',
            tapEvent: () {
              navKey.currentState.pushNamed(routeContactMe);
              state.close();
            },
          ),
          NavMobileItem(
            text: 'My CV',
            tapEvent: () async {
              const url =
                  'https://drive.google.com/file/d/1VbXBZXTgA9deITr3vguO6UmAPqqosrkU/view?usp=sharing';
              await canLaunch(url)
                  ? await launch(url)
                  : throw 'Could not launc $url';
            },
          ),
        ],
      ),
    );
  }
}

class NavMobileItem extends StatelessWidget {
  const NavMobileItem({
    Key key,
    @required this.text,
    this.tapEvent,
  }) : super(key: key);

  final String text;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapEvent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Text(
          text,
          style: const TextStyle(
            color: kTextColor,
            fontWeight: FontWeight.w300,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

class RootDrawer {
  static DrawerControllerState of(BuildContext context) {
    final DrawerControllerState drawerControllerState =
        context.findRootAncestorStateOfType();
    return drawerControllerState;
  }
}
