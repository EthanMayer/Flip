import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Home', style: TextStyle(color:
                Color.fromRGBO(216, 171, 76, 1),)
              ),
            ),
          ],
        )
    );
  }
}