import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'login_view.dart';
import 'account_view.dart';
import 'add_music_view.dart';
import 'add_drill_view.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

/// Creates and manages the Home screen.
class HomeView extends StatelessWidget {
  HomeView({Key key, this.conductor}) : super(key: key);
  final bool conductor;

  Column _buildColumn(BuildContext context) {
    if (conductor) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: Text(
                  'Add New Sheet Music',
                  style: Styles.textButton,
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => AddMusicView()
                  ));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: Text(
                  'Add New Drill Sheets',
                  style: Styles.textButton,
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => AddDrillView()
                  ));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: Text(
                  'Global Music Pull-Up',
                  style: Styles.textButton,
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => AddMusicView()
                  ));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 0, right: 0, top: 35.0, bottom: 0),
            child: SizedBox(
              width: 370,
              child: CupertinoButton(
                child: Text(
                  'Global Drill Pull-Up',
                  style: Styles.textButton,
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (_) => AddMusicView()
                  ));
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
                pressedOpacity: 0.75,
              ),
            ),
          ),
        ]
      );
    } else {
      return null;
    }
  }

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            // Navigation bar at the top of the screen that contains the view title and navigation buttons.
            CupertinoSliverNavigationBar(
              automaticallyImplyLeading: false,
              largeTitle: Text(
                'Home',
                style: TextStyle(color: Styles.gold),
              ),
              // Right nav bar button, navigates to Account view.
              trailing: CupertinoButton(
                  child: Icon(CupertinoIcons.person),
                  // Text(
                  //   'Account',
                  //   style: TextStyle(color: Styles.systemBlue),
                  // ),
                  padding: EdgeInsets.all(10),
                  // Navigates to Account View when pressed.
                  onPressed: () {
                    // Navigator.push(
                    //     context, CupertinoPageRoute(builder: (_) => AccountView()
                    // ));
                    showCupertinoModalBottomSheet(
                        context: context,
                        expand: true,
                        duration: Duration(milliseconds: 300),
                        builder: (_) => AccountView());
                  }
                ),
            ),
            // SliverPadding(
            //   padding: const EdgeInsets.only(
            //       left: 30.0, right: 30.0, top: 25.0, bottom: 0),
            // ),
            SliverFillRemaining(
              child: _buildColumn(context)
            ),
          ],
        )
    );
  }

}
