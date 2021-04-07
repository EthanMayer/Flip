import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:flip/utilities/styles.dart';

/// Creates and manages the Drill File screen.
class DrillFileView extends StatelessWidget {
  DrillFileView({Key key}) : super(key: key);

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoScrollbar(
            child: CustomScrollView(
              slivers: [
                // Navigation bar at the top of the screen that contains the view title and navigation buttons.
                CupertinoSliverNavigationBar(
                  largeTitle: Text(
                      'Drill',
                      style: TextStyle(color: Styles.gold,)
                  ),
                  previousPageTitle: 'Shows',
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(top: 5.0),
                ),
                // Create the folder grid.
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 30.0,
                    childAspectRatio: 3 / 3,
                  ),
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                      // Create the objects in the grid.
                      return Stack(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image:
                                  DecorationImage(
                                    image: AssetImage('assets/images/file_white.png'),
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
                              PdftronFlutter.openDocument("https://pdftron.s3.amazonaws.com/downloads/pdfref.pdf");
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
        )
    );
  }
}