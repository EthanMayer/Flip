import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'styles.dart';

class DrillFileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverNavigationBar(
              largeTitle: Text('Drill', style: TextStyle(color:
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
                                    'assets/images/file_white.png'
                                ),
                                fit: BoxFit.none,
                              )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 165.0),
                            child: Text('Drill Chart $index'),
                          )
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