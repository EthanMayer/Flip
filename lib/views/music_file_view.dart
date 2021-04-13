import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:pdftron_flutter/pdftron_flutter.dart';
//import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';

/// Manages dynamic state for the Music File class.
class MusicFileView extends StatefulWidget {
  MusicFileView({Key key, this.id}) : super(key: key);
  final int id;

  /// Creates the dynamic state for the Music File class.
  @override
  _MusicFileViewState createState() => _MusicFileViewState(id);
}

/// Creates and manages the Music File screen.
class _MusicFileViewState extends State<MusicFileView> {
  _MusicFileViewState(this.id);
  final int id;
  List<Map<String, dynamic>> dataList;
  int children = 0;
  FlipDatabase db = FlipDatabase.instance;
  PDFDocument doc;

  /// Called on view load to initialize the view.
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
    dataList = await db.queryID(FlipDatabase.musicFileTable, id);
    setState(() {
      children = dataList.length;
    });
  }

  void _loadFromAssets() async {
    doc = await PDFDocument.fromAsset('data/Dynamite/Dynamite_2019-AllParts.pdf');
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
                  largeTitle: Text('Parts', style: TextStyle(color:
                  Styles.gold)
                  ),
                  previousPageTitle: 'Instruments',
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
                                child: Text(dataList[index]["music_file_name"]),
                              )
                          ),
                          GestureDetector(
                              onTap: () async {
                                doc = await PDFDocument.fromAsset('data/Dynamite/Dynamite_2019-AllParts.pdf');
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) {
                                      return PDFViewer(
                                          document: doc,
                                      );
                                    }
                                  )
                                );
                              }
                          )
                        ],
                      );
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

class MyPDFViewer extends PDFViewer {

}