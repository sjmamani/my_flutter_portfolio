import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/routes_generator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../responsive.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: 20, horizontal: isMobile(context) ? 20 : 40),
      child: Row(
        children: [
          if (isMobile(context))
            IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                }),
          if (!isMobile(context))
            Row(
              children: const [
                Icon(
                  Icons.mail_outline,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(
                  "santiagojmamani@gmail.com",
                  style:
                      TextStyle(color: kTextColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          const Spacer(),
          if (!isMobile(context))
            Row(
              children: [
                NavItem(
                  title: 'Home',
                  tapEvent: () {
                    navKey.currentState.pushNamed(routeHome);
                  },
                ),
                NavItem(
                  title: 'My Projects',
                  tapEvent: () {
                    navKey.currentState.pushNamed(routeMyProjects);
                  },
                ),
                NavItem(
                  title: 'Contact Me',
                  tapEvent: () {
                    navKey.currentState.pushNamed(routeContactMe);
                  },
                ),
                NavItem(
                  title: 'My CV',
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
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.title,
    @required this.tapEvent,
  }) : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: tapEvent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: InteractiveText(
          text: title,
        ),
      ),
    );
  }
}

class InteractiveText extends StatefulWidget {
  final String text;

  const InteractiveText({@required this.text});

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: Text(
        widget.text,
        style: _hovering
            ? TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: isMobile(context) ? 22 : 14,
              )
            : TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.w300,
                fontSize: isMobile(context) ? 22 : 14,
              ),
      ),
    );
  }

  void _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}
