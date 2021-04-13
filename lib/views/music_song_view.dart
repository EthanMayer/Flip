import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_instrument_view.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';

/// Manages dynamic state for the Music class.
class MusicSongView extends StatefulWidget {
  MusicSongView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Music Folder class.
  @override
  _MusicSongViewState createState() => _MusicSongViewState();
}

/// Creates and manages the Music Folder screen.
class _MusicSongViewState extends State<MusicSongView> {
  FlipDatabase db = FlipDatabase.instance;

  List<Map<String, dynamic>> dataList;


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
    dataList = await db.query(FlipDatabase.musicSongTable);
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
              largeTitle: Text('Music', style: TextStyle(color:
              Styles.gold)
              ),
              // middle: CupertinoSearchTextField(
              // TODO: Fix search bar
              // ),
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
                          padding: const EdgeInsets.only(top: 160.0),
                          child: Text(dataList[index]["music_song_name"]),
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
                              return MusicInstrumentView();
                            })
                          );
                        }
                      )
                    ],
                  );
                },
                childCount: dataList.length,
              ),
            ),
          ],
        )
      )
    );
  }
}