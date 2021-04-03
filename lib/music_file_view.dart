import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdftron_flutter/pdftron_flutter.dart';
import 'styles.dart';

/// Manages dynamic state for the Music File class.
class MusicFileView extends StatefulWidget {
  MusicFileView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Music File class.
  @override
  _MusicFileViewState createState() => _MusicFileViewState();
}

/// Creates and manages the Music File screen.
class _MusicFileViewState extends State<MusicFileView> {

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
                  largeTitle: Text('Parts', style: TextStyle(color:
                  Styles.gold)
                  ),
                  previousPageTitle: 'Instruments',
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
                                child: Text('Instrument Part $index PDF'),
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