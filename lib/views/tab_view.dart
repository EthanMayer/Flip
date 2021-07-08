import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_view.dart';
import 'music_song_view.dart';
import 'drill_show_view.dart';
import 'package:flip/utilities/styles.dart';

// Global keys for the tab bar to navigate to the correct classes.
GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();

/// Manages dynamic state for the class.
class TabView extends StatefulWidget {
  TabView({Key key, this.conductor = false}) : super(key: key);
  final bool conductor;

  /// Creates the dynamic state for the class.
  @override
  _TabViewState createState() => _TabViewState(conductor);
}

/// Creates the tab bar at the bottom of the screen consisting of 3 tabs.
class _TabViewState extends State<TabView> {
  _TabViewState(this.conductor);
  final bool conductor;
  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        activeColor: Styles.gold,
        items: [
          // Home tab button.
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home'
          ),
          // Music tab button.
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.music_note_list),
              label: 'Music'
          ),
          // Drill tab button.
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.circle_grid_3x3),
              label: 'Drill'
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          // Navigate to Home view.
          return CupertinoTabView(
            navigatorKey: firstTabNavKey,
            builder: (BuildContext context) => HomeView(conductor: conductor),
          );
        } else if (index == 1) {
          // Navigate to Music view.
          //MusicSongViewState(false).refreshData();
          return CupertinoTabView(
            navigatorKey: secondTabNavKey,
            builder: (BuildContext context) => MusicSongView(),
          );
        } else {
          // Navigate to Drill view.
          return CupertinoTabView(
            navigatorKey: thirdTabNavKey,
            builder: (BuildContext context) => DrillShowView(),
          );
        }
      },
    );
  }
}