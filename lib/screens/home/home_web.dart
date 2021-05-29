import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/components/navbar.dart';
import 'package:my_flutter_portfolio/screens/home/home.dart';

import '../../responsive.dart';
import 'components/footer.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return isMobile(context)
        ? const HomeScreen()
        : Scaffold(
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
