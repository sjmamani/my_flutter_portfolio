import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/components/navbar.dart';
import 'package:my_flutter_portfolio/routes_generator.dart';
import 'package:my_flutter_portfolio/screens/contact-me/contact_me.dart';
import 'package:my_flutter_portfolio/screens/home/components/jumbotron.dart';
import 'package:my_flutter_portfolio/screens/projects/projects.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants.dart';
import '../../responsive.dart';
import 'components/footer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectIndex = 0;

  Widget _getDrawerItemWidget(int index) {
    switch (index) {
      case 0:
        return const Jumbotron();
        break;
      case 1:
        return const Projects();
        break;
      case 2:
        return const ContactMe();
        break;
      default:
        return const Jumbotron();
    }
  }

  void _onSelectedItem(int index) {
    Navigator.pop(context);
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: isMobile(context)
          ? Drawer(
              child: Center(
                child: Column(
                  children: [
                    NavMobileItem(
                      text: 'Home',
                      tapEvent: () {
                        _onSelectedItem(0);
                      },
                    ),
                    NavMobileItem(
                      text: 'My Projects',
                      tapEvent: () {
                        _onSelectedItem(1);
                      },
                    ),
                    NavMobileItem(
                      text: 'Contact Me',
                      tapEvent: () {
                        _onSelectedItem(2);
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
              ),
            )
          : null,
      body: Column(
        children: [
          const Navbar(),
          Expanded(child: _getDrawerItemWidget(_selectIndex)),
          const Footer(),
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
