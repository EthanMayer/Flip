import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account_view.dart';
import 'package:flip/utilities/styles.dart';
import 'tab_view.dart';
import 'package:flip/sqlite_test.dart';
import 'package:flip/utilities/client.dart';



// The correct login password.
const String CORRECT_PASSWORD = "vandy";
const String CONDUCTOR_PASSWORD = "Vandy";

/// Manages dynamic state for the Login class.
class LoginView extends StatefulWidget {
  LoginView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Login class.
  @override
  _LoginViewState createState() => _LoginViewState();
}

/// Creates and manages the Login screen.
class _LoginViewState extends State<LoginView> {

  String _password = "";
  bool _firstLaunch = false; // First time launching the app?

  /// Called on view load to initialize the view.
  @override
  void initState() {
    super.initState();
    _setup();
  }

  /// Asynchronously access the phone preferences on view load to grab data.
  _setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _firstLaunch = prefs.getBool('firstLaunch') ?? true;
    if (_firstLaunch) {
      prefs.setBool('firstLaunch', false);
    }
  }

  /// Validate password when submitted to determine which view to load.
  _validatePassword() {
    if(_password == CORRECT_PASSWORD || _password == CONDUCTOR_PASSWORD) {
      //Client.initialize();
      if (_firstLaunch && _password == CORRECT_PASSWORD) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => AccountView(first: true)
        ));
      } else if (_password == CONDUCTOR_PASSWORD) {
        Client.master = true;
        Navigator.push(
            context, CupertinoPageRoute(builder: (_) => TabView(c: true)
        ));
      } else {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => TabView(c: false)
        ));
      }
    } else {
      _showDialog(context);
    }
  }

  /// Shows a pop up error box when the incorrect password is entered.
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

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Create the screen title.
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Text(
                 'Flip',
                  style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                )
              )
            ),
            // Create the Star V image.
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/starV_873.png')),
              ),
            ),
            // Create the password text box.
            Padding(
              padding: const EdgeInsets.only(
                  left: 40.0, right: 40.0, top: 55.0, bottom: 0),
              child: CupertinoTextField(
                placeholder: 'Password',
                obscureText: true,
                textAlign: TextAlign.center,
                placeholderStyle: Styles.textRowPlaceholder,
                style: Styles.textRowPlaceholder,
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                onChanged: (text) {
                  _password = text;
                },
                onSubmitted: (text) {
                  _validatePassword();
                },
              ),
            ),
            // Create the login button.
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 25.0, bottom: 0),
              child: CupertinoButton(
                child: Text(
                  'Login',
                  style: Styles.textButton,
                ),
                onPressed: () {
                  //main(); // Test sqlite
                  _validatePassword();
                },
                borderRadius: BorderRadius.circular(25.0),
                color: Styles.gold,
                pressedOpacity: 0.75,
              ),
            )
          ],
        ),
      ),
    );
  }
}