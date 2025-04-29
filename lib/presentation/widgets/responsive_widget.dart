import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobileWidget;
  final Widget tabletWidget;
  final Widget desktopWidget;

   const ResponsiveWidget({
    Key? key,
    required this.mobileWidget,
    required this.tabletWidget,
    required this.desktopWidget,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileWidget;
        } else if (constraints.maxWidth < 1200) {
          return tabletWidget;
        } else {
          return desktopWidget;
        }
      },
    );
  }
}