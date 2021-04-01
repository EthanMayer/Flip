import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_file_view.dart';
import 'styles.dart';

final Color darkerVandyGold = Color.fromRGBO(153, 127, 61, 1);

class MusicFolderView extends StatefulWidget {
  MusicFolderView({Key key}) : super(key: key);

  @override
  _MusicFolderViewState createState() => _MusicFolderViewState();
}

class _MusicFolderViewState extends State<MusicFolderView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Instruments', style: TextStyle(color:
              Styles.gold)
              ),
              previousPageTitle: 'Music',
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 5.0),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 30.0,
                childAspectRatio: 3 / 3,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          //color: _cellColor,
                          decoration: BoxDecoration(
                              image:
                              DecorationImage(
                                image: AssetImage(
                                    'assets/images/folder_white.png'
                                ),
                                fit: BoxFit.none,
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 160.0),
                            child: Text('Instrument Folder $index'),
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            //setState(() {
                              //_cellColor = darkerVandyGold;
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) {
                                    return MusicFileView();
                                  })
                              );
                            //});
                          }
                      )
                    ],
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        )
    );
  }
}