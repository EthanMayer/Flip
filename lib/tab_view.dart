import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_view.dart';
import 'music_view.dart';
import 'settings_view.dart';

GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

class TabView extends StatefulWidget {
  TabView({Key key}) : super(key: key);

  @override
  _TabViewState createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Color.fromRGBO(216, 171, 76, 1),
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),//Icon(Icons.home),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_note_list),//Icon(Icons.queue_music),
              label: 'Music'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings),//Icon(Icons.settings),
              label: 'Settings'
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => HomeView(),
          );
        } else if (index == 1) {
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => MusicView(),
          );
        } else {
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => SettingsView(),
          );
        }
      },
    );
  }
}