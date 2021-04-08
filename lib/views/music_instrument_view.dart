import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_file_view.dart';
import 'package:flip/utilities/styles.dart';

/// Manages dynamic state for the Music Folder class.
class MusicInstrumentView extends StatefulWidget {
  MusicInstrumentView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Music Folder class.
  @override
  _MusicFolderViewState createState() => _MusicFolderViewState();
}

/// Creates and manages the Music Folder screen.
class _MusicFolderViewState extends State<MusicInstrumentView> {

  /// Called on view load to initialize the view.
  @override
  void initState() {
    super.initState();
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
                                child: Text('Instrument Folder $index'),
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
                                      return MusicFileView();
                                    })
                                );
                                //});
                              }
                          )
                        ],
                      );
                    },
                    childCount: 4,
                  ),
                ),
              ],
            )
        )
    );
  }
}