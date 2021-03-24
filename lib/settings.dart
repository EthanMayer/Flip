import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Settings', style: TextStyle(color:
                Color.fromRGBO(216, 171, 76, 1),)
              ),
            ),
          ],
        )
    );
  }
}