import 'package:flutter/material.dart';

class ScreenSize extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenSize({
    Key key,
    @required this.mobile,
    this.tablet,
    @required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 450;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 450 &&
      MediaQuery.of(context).size.width < 800;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return desktop;
        } else if (constraints.maxWidth >= 450) {
          return tablet;
        } else {
          return mobile;
        }
      },
    );
  }
}
