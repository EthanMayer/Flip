import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'styles.dart';

final Color darkerVandyGold = Color.fromRGBO(153, 127, 61, 1);

class MusicFileView extends StatefulWidget {
  MusicFileView({Key key}) : super(key: key);

  @override
  _MusicFileViewState createState() => _MusicFileViewState();
}

class _MusicFileViewState extends State<MusicFileView> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Music Files', style: TextStyle(color:
              Styles.gold)
              ),
              previousPageTitle: 'Music Folders',
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
                        color: Styles.gold,
                        child: Text('Instrument Part $index PDF'),
                      ),
                      GestureDetector(
                          onTap: () {
                            //setState(() {
                              //_cellColor = darkerVandyGold;
                              PdftronFlutter.openDocument("https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf");
                            //});
                          }
                      )
                    ],
                  );
                },
                childCount: 2,
              ),
            ),
          ],
        )
    );
  }
}