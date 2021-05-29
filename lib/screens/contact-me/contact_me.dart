import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../responsive.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconSize = isMobile(context) ? 35.0 : 55.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            style: TextStyle(fontSize: isMobile(context) ? 24 : 42),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _launchURL(
                    'https://www.linkedin.com/in/joaquin-santiago-mamani'),
                child: Image.asset(
                  'assets/icons/linkedin.png',
                  height: iconSize,
                  width: iconSize,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () => _launchURL('https://www.github.com/sjmamani'),
                child: Image.asset(
                  'assets/icons/github.png',
                  height: iconSize,
                  width: iconSize,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () =>
                    _launchURL('https://www.twitter.com/santiagojmamani'),
                child: Image.asset(
                  'assets/icons/twitter.png',
                  height: iconSize,
                  width: iconSize,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
