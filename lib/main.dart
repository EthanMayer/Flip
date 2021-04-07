import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'views/login_view.dart';

/// Called initially to start the app.
void main() => runApp(Flip());

/// Base class of the app.
class Flip extends StatelessWidget {
  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    // CupertinoApp is the iOS-style widget that acts as the root widget of the app.
    return CupertinoApp(
      title: 'Flip',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: LoginView(),
    );
  }
}
