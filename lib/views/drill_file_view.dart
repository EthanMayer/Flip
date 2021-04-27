import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';
//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

/// Creates and manages the Drill File screen.
class DrillFileView extends StatefulWidget {
  DrillFileView({Key key, this.id}) : super(key: key);
  final int id;

  /// Creates the dynamic state for the Music Folder class.
  @override
  _DrillFileViewState createState() => _DrillFileViewState(id);
}

/// Creates and manages the Music Folder screen.
class _DrillFileViewState extends State<DrillFileView> {
  _DrillFileViewState(this.id);
  final int id;
  FlipDatabase db = FlipDatabase.instance;
  List<Map<String, dynamic>> dataList;
  int children = 0;
  //PDFDocument doc;

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
    dataList = await db.queryID(FlipDatabase.drillFileTable, id);
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
                      'Drill',
                      style: TextStyle(color: Styles.gold,)
                  ),
                  previousPageTitle: 'Shows',
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
                                      image: AssetImage('assets/images/file_white.png'),
                                      fit: BoxFit.none,
                                    )
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 155.0),
                                  child: Text(dataList[index]["drill_file_name"]),
                                )
                            ),
                            GestureDetector(
                                // onTap: () async {
                                //   doc = await PDFDocument.fromAsset(
                                //       'data/Dynamite/Dynamite_2019-AllParts.pdf');
                                //   Navigator.push(
                                //       context,
                                //       CupertinoPageRoute(builder: (context) {
                                //         return PDFViewer(
                                //           document: doc,
                                //         );
                                //       }
                                //       )
                                //   );
                                // }
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(builder: (context) {
                                    return PDF(
                                      swipeHorizontal: true,
                                      nightMode: true,
                                    ).fromAsset('data/Dynamite/Blank_Drill_Chart.pdf');
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