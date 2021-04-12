import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';

class AddMusicView extends StatelessWidget {
  AddMusicView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          // Navigation bar at the top of the screen that contains the view title and navigation buttons.
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Add Music',
              style: TextStyle(color: Styles.gold),
            ),
            previousPageTitle: "Home",
            // Right nav bar button, navigates to Account view.
            // trailing: CupertinoButton(
            //     child: Text(
            //       'Account',
            //       style: TextStyle(color: Styles.systemBlue),
            //     ),
            //     padding: EdgeInsets.all(10),
            //     // Navigates to Account View when pressed.
            //     onPressed: () {
            //       Navigator.push(
            //           context, CupertinoPageRoute(builder: (_) => AccountView()
            //       ));
            //     }),
          ),
        ],
      )
    );
  }
}