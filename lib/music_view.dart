import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'home_view.dart';
import 'music_folder_view.dart';

final Color vandyGold = Color.fromRGBO(216, 171, 76, 1);
final Color darkerVandyGold = Color.fromRGBO(153, 127, 61, 1);

class MusicView extends StatefulWidget {
  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {

  Color _cellColor = vandyGold;

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
                        color: _cellColor,
                        child: Text('Grid Item $index'),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            //_cellColor = darkerVandyGold;
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) {
                                return MusicFolderView();
                              })
                            );
                          });
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