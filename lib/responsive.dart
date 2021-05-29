import 'package:flutter/material.dart';

bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 795;
bool isTab(BuildContext context) =>
    MediaQuery.of(context).size.width < 1300 &&
    MediaQuery.of(context).size.width >= 795;
bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1300;
