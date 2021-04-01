import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'login_view.dart';

void main() => runApp(Flip());

class Flip extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flip',
      theme: CupertinoThemeData(brightness: Brightness.dark),
      home: LoginView(),
    );
  }
}
