import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'login_view.dart';
import 'account_view.dart';

/// Creates and manages the Home screen.
class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            // Navigation bar at the top of the screen that contains the view title and navigation buttons.
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Home',
                style: TextStyle(color: Styles.gold),
              ),
              // Left nav bar button, navigates to Login view (DEBUG ONLY).
              leading: CupertinoButton(
                  child: Text(
                    'DEBUGL',
                    style: TextStyle(color: Styles.systemBlue),
                  ),
                  padding: EdgeInsets.all(10),
                  // Navigates to Login View when pressed.
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, CupertinoPageRoute(builder: (_) => LoginView()
                    ));
                  }),
              // Right nav bar button, navigates to Account view.
              trailing: CupertinoButton(
                  child: Text(
                    'Account',
                    style: TextStyle(color: Styles.systemBlue),
                  ),
                  padding: EdgeInsets.all(10),
                  // Navigates to Account View when pressed.
                  onPressed: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (_) => AccountView()
                    ));
                  }),
            ),
          ],
        )
    );
  }
  
}