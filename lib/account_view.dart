import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_view.dart';
import 'main.dart';

class AccountView extends StatefulWidget {
  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Account'),
        leading: CupertinoButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                //fontSize: 25,
                //fontWeight: FontWeight.bold),
              ),
            ),
            onPressed: () {
              Navigator.pushReplacement(
                  context, CupertinoPageRoute(builder: (_) => MainPage()
              ));
            }),
        trailing: CupertinoButton(
          child: Text(
            'Done',
            style: TextStyle(
                color: CupertinoColors.systemBlue,
                //fontSize: 25,
                //fontWeight: FontWeight.bold),
          ),
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context, CupertinoPageRoute(builder: (_) => MainPage()
          ));
        }),
      ),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                        child: Text(
                          'Flip',
                          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/images/starV_873.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 50.0, bottom: 0),
                  child: CupertinoTextField(
                    placeholder: 'Username',
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 20
                    ),
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 0.0, top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25.0, bottom: 0),
                  child: CupertinoTextField(
                    placeholder: 'Password',
                    obscureText: true,
                    placeholderStyle: TextStyle(
                        color: CupertinoColors.systemGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                    style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 20
                    ),
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 0.0, top: 15.0, bottom: 15.0),
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25.0, bottom: 0),
                  child: CupertinoButton(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, CupertinoPageRoute(builder: (_) => MainPage()
                      ));
                    },
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromRGBO(216, 171, 76, 1),
                  ),
                )
              ]
          )
        )
    );
  }
}