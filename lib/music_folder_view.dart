import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';

final Color vandyGold = Color.fromRGBO(216, 171, 76, 1);
final Color darkerVandyGold = Color.fromRGBO(153, 127, 61, 1);

class MusicFolderView extends StatefulWidget {
  MusicFolderView({Key key}) : super(key: key);

  @override
  _MusicFolderViewState createState() => _MusicFolderViewState();
}

class _MusicFolderViewState extends State<MusicFolderView> {

  Color _cellColor = vandyGold;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Music Folder', style: TextStyle(color:
              Color.fromRGBO(216, 171, 76, 1),)
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
                        child: Text('Music PDF $index'),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              //_cellColor = darkerVandyGold;
                              PdftronFlutter.openDocument('file:///data/Dynamite/Dynamite_2019-AllParts.pdf');
                            });
                          }
                      )
                    ],
                  );
                },
                childCount: 3,
              ),
            ),
          ],
        )
    );
  }
}