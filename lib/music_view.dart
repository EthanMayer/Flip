import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_folder_view.dart';
import 'styles.dart';

final Color vandyGold = Color.fromRGBO(216, 171, 76, 1);
final Color darkerVandyGold = Color.fromRGBO(153, 127, 61, 1);

class MusicView extends StatefulWidget {
  MusicView({Key key}) : super(key: key);

  @override
  _MusicViewState createState() => _MusicViewState();
}

class _MusicViewState extends State<MusicView> {

  Color _cellColor = vandyGold;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CupertinoScrollbar( //todo currently this scrollbar does not show up
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Music', style: TextStyle(color:
              Styles.gold)
              ),
              // middle: CupertinoSearchTextField(
              // TODO: Fix search bar
              // ),
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
                          child: Text('Music Folder $index'),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          //setState(() {
                            //_cellColor = darkerVandyGold;
                            Navigator.push(
                              context,
                              CupertinoPageRoute(builder: (context) {
                                return MusicFolderView();
                              })
                            );
                          //});
                        }
                      )
                    ],
                  );
                },
                //childCount: 20,
              ),
            ),
          ],
        )
      )
    );
  }
}