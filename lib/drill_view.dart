import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'styles.dart';
import 'drill_file_view.dart';

class DrillView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Shows', style: TextStyle(color:
                Styles.gold,)
              ),
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
                            padding: const EdgeInsets.only(top: 165.0),
                            child: Text('Show $index Drill'),
                          )
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, CupertinoPageRoute(builder: (_) => DrillFileView()
                            ));
                            //setState(() {
                            //_cellColor = darkerVandyGold;
                            //PdftronFlutter.openDocument("https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf");
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