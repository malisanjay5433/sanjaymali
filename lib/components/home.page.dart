// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:sanjaymali/components/Custom.tab.dart';
import 'package:sanjaymali/components/content.view.dart';
import 'package:sanjaymali/components/custom.tabbar.dart';
import 'package:sanjaymali/helper/app.style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController tabController;
  late double screenWidth;
  late double screenHeight;
  late double topPadding;
  late double bottomPadding;

  List<ContentView> contentViews = [
    ContentView(
        tab: const CustomTab(title: 'Home'),
        content: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
        )),
    ContentView(
        tab: const CustomTab(title: 'Service'),
        content: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        )),
    ContentView(
        tab: const CustomTab(title: 'Projects'),
        content: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        )),
    ContentView(
        tab: const CustomTab(title: 'Contacts'),
        content: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.pink,
          ),
        ))
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 65,
          titleSpacing: 0.1,
          elevation: 1,
          title: Text(
            '< Sanjay Mali />',
            style: AppTextStyles.headingAppName(),
          ),
        ),
        key: scaffoldKey,
        // endDrawer: drawer(),
        backgroundColor: const Color(0xff1e1e24),
        body: LayoutBuilder(builder: (context, constraint) {
          if (constraint.maxWidth > 715) {
            return desktop();
          } else {
            return mobile();
          }
        }));
  }

  Widget desktop() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTabBar(
              controller: tabController,
              tabs: contentViews.map((e) => e.tab).toList()),
          Container(
            height: screenHeight * 0.85,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.tab).toList(),
            ),
          )
        ]);
  }

  Widget mobile() {
    return Container(
      width: screenWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(
                Icons.menu_open_outlined,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
        child: ListView(
            children: contentViews
                .map((e) => Container(
                      child: ListTile(
                        title: Text(e.tab.title),
                        onTap: () {},
                      ),
                    ))
                .toList()));
  }
}
