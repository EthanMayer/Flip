import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_file_view.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';

/// Manages dynamic state for the Music Folder class.
class MusicInstrumentView extends StatefulWidget {
  MusicInstrumentView({Key key, this.id}) : super(key: key);
  final int id;

  /// Creates the dynamic state for the Music Folder class.
  @override
  _MusicFolderViewState createState() => _MusicFolderViewState(id);
}

/// Creates and manages the Music Folder screen.
class _MusicFolderViewState extends State<MusicInstrumentView> {
  _MusicFolderViewState(this.id);
  final int id;
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
    dataList = await db.queryID(FlipDatabase.musicInstrumentTable, id);
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
                  largeTitle: Text('Instruments', style: TextStyle(color:
                  Styles.gold)
                  ),
                  previousPageTitle: 'Music',
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
                                    image: AssetImage('assets/images/folder_white.png'),
                                    fit: BoxFit.none,
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 150.0),
                                child: Text(dataList[index]["music_instrument_name"]),
                              )
                          ),
                          GestureDetector(
                              onTap: () {
                                //TODO: object darkens when pressed
                                //setState(() {
                                //_cellColor = darkerVandyGold;
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(builder: (context) {
                                      return MusicFileView(id: dataList[index]["music_instrument_id"]);
                                    })
                                );
                                //});
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