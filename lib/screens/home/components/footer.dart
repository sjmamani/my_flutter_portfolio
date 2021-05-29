import 'package:emojis/emojis.dart';
import 'package:flutter/material.dart';

import '../../../responsive.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: 30.0,
      alignment: Alignment.center,
      child: Text(
        'Made with Flutter ${Emojis.blueHeart} | © 2021 Santiago Mamani',
        style: TextStyle(
          fontSize: isMobile(context) ? 12 : 16,
        ),
      ),
    );
  }
}
