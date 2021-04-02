import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_view.dart';
import 'styles.dart';
import 'tab_view.dart';

const String CORRECT_PASSWORD = "vandy";

class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  String _password = "";
  bool _firstLaunch = false;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  _setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (_firstLaunch) {
      prefs.setBool('firstLaunch', false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
                  left: 40.0, right: 40.0, top: 55.0, bottom: 0),
              child: CupertinoTextField(
                placeholder: 'Password',
                obscureText: true,
                textAlign: TextAlign.center,
                // onChanged: (text) {
                //   password = text;
                // },
                placeholderStyle: Styles.textRowPlaceholder,
                style: Styles.textRowPlaceholder,
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onSubmitted: (text) {
                  _password = text;
                  if(text == CORRECT_PASSWORD) {
                    if (_firstLaunch) {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => AccountView()
                      ));
                    } else {
                      Navigator.pushReplacement(
                          context, CupertinoPageRoute(builder: (_) => TabView()
                      ));
                    }
                  } else {
                    _showDialog(context);
                  }
                },
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
                  if(_password == CORRECT_PASSWORD) {
                    if (_firstLaunch) {
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => AccountView()
                      ));
                    } else {
                      Navigator.pushReplacement(
                          context, CupertinoPageRoute(builder: (_) => TabView()
                      ));
                    }
                  } else {
                    _showDialog(context);
                  }
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
              ),
            )
          ],
        ),
      ),
    );
  }
}


_showDialog(BuildContext context) {
  CupertinoAlertDialog alert = CupertinoAlertDialog(
    content: Text('Error: Incorrect Password'),
    actions: [
      CupertinoDialogAction(
        child: Text('OK'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  return showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
