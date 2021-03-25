import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MusicView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Music', style: TextStyle(color:
                Color.fromRGBO(216, 171, 76, 1))
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 3 / 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        color: Color.fromRGBO(216, 171, 76, 1),
                        child: Text('Grid Item $index'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Color.fromRGBO(153, 127, 61, 1);
                        }
                      )
                    ],
                  );
                  //   Container(
                  //   alignment: Alignment.center,
                  //   color: Color.fromRGBO(216, 171, 76, 1),//blue[100 * (index % 9)],
                  //   child: Stack(
                  //       //mainAxisAlignment: MainAxisAlignment.center,
                  //       children: <Widget>[
                  //         Text('Grid Item $index'),
                  //         GestureDetector(
                  //           onTap: () {
                  //             Color.fromRGBO(153, 127, 61, 1);
                  //           }
                  //         )
                  //       ]
                  //   )
                  // );
                },
                //childCount: 20,
              ),
            ),
          ],
        )
    );
  }
}