import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'login_view.dart';
import 'account_view.dart';
import 'addmusic_view.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

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
            CupertinoButton(
              child: Text(
                'Add New Sheet Music',
                style: Styles.textButton,
              ),
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (_) => FirstRoute()
                ));
              },
              borderRadius: BorderRadius.circular(25.0),
              color: Styles.gold,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 25.0, bottom: 0),
            )
          ],
        )
    );
  }

}
