import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey.withOpacity(0.8),
        middle: const Text('Home'),
        
      ),
      child: Container(
        color: CupertinoColors.systemRed,
      ),
      // Column(
      //     children: <Widget>[
      //       Container(height: 50, color: CupertinoColors.systemRed),
      //       Container(height: 50, color: CupertinoColors.systemGreen),
      //       Container(height: 50, color: CupertinoColors.systemBlue),
      //       Container(height: 50, color: CupertinoColors.systemYellow),
      //     ]
      // )
    );
  }
}