import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'login_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              leading: CupertinoButton(
                  child: Text(
                    'DEBUGL',
                    style: TextStyle(
                      color: CupertinoColors.systemBlue,
                      //fontSize: 25,
                      //fontWeight: FontWeight.bold),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context, CupertinoPageRoute(builder: (_) => LoginView()
                    ));
                  }),
              largeTitle: Text('Home', style: TextStyle(color:
                Styles.gold),
              ),
            ),
          ],
        )
    );
  }
}