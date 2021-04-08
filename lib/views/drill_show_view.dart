import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'drill_file_view.dart';

/// Creates and manages the Drill screen.
class DrillShowView extends StatelessWidget {
  DrillShowView({Key key}) : super(key: key);

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CupertinoScrollbar(
            child: CustomScrollView(
              slivers: [
                // Navigation bar at the top of the screen that contains the view title and navigation buttons.
                CupertinoSliverNavigationBar(
                  largeTitle: Text('Shows', style: TextStyle(color:
                  Styles.gold,)
                  ),
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
                                    image: AssetImage('assets/images/folder_white.png'),
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