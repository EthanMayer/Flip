import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'login_view.dart';
import 'account_view.dart';

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
                      color: Styles.systemBlue,
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
              trailing: CupertinoButton(
                  child: Text(
                    'Account',
                    style: TextStyle(
                      color: Styles.systemBlue,
                      //fontSize: 25,
                      //fontWeight: FontWeight.bold),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  onPressed: () {
                    Navigator.push(
                        context, CupertinoPageRoute(builder: (_) => AccountView()
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