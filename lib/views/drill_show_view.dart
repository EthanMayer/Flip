import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'drill_file_view.dart';
import 'package:flip/utilities/flip_database.dart';

/// Creates and manages the Drill screen.
class DrillShowView extends StatefulWidget {
  DrillShowView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Music Folder class.
  @override
  _DrillShowViewState createState() => _DrillShowViewState();
}

/// Creates and manages the Music Folder screen.
class _DrillShowViewState extends State<DrillShowView> {
  FlipDatabase db = FlipDatabase.instance;
  List<Map<String, dynamic>> dataList;
  int children = 0;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  _refreshData() {
    setState(() {
      _getData();
    });
  }

  void _getData() async {
    dataList = await db.query(FlipDatabase.drillShowTable);
    setState(() {
      children = dataList.length;
    });
  }

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
                      'Shows',
                      style: TextStyle(color: Styles.gold,)
                  ),
                  trailing: CupertinoButton(
                      child: Icon(CupertinoIcons.refresh),
                      padding: EdgeInsets.all(10),
                      // Navigates to Account View when pressed.
                      onPressed: () {
                        _refreshData();
                      }),
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
                      if (dataList == null) {
                        return null;
                      } else {
                        // Create the objects in the grid.
                        return Stack(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image:
                                    DecorationImage(
                                      image: AssetImage(
                                          'assets/images/folder_white.png'),
                                      fit: BoxFit.none,
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 160.0),
                                  child: Text(
                                      dataList[index]["drill_show_name"]),
                                )
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _refreshData();
                                  });
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(builder: (context) {
                                        return DrillFileView(
                                            id: dataList[index]["drill_show_id"]);
                                      })
                                  );
                                }
                            )
                          ],
                        );
                      }
                    },
                    childCount: children,
                  ),
                ),
              ],
            )
        )
    );
  }
}