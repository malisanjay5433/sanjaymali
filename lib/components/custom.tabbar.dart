import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;
  const CustomTabBar({super.key, required this.controller, required this.tabs});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (kDebugMode) {
      print(screenWidth);
    }
    double tabBarScale = screenWidth > 1512
        ? 0.21
        : screenWidth > 1100
            ? 0.4
            : 0.5;
    return Container(
      color: Colors.transparent,
      width: screenWidth * tabBarScale,
      child: Theme(
          data: ThemeData(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent),
          child: TabBar(controller: controller, tabs: tabs)),
    );
  }
}
