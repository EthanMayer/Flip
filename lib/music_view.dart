import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'music_folder_view.dart';
import 'styles.dart';

/// Manages dynamic state for the Music class.
class MusicView extends StatelessWidget {
  MusicView({Key key}) : super(key: key);

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
                          child: Text('Music Folder $index'),
                        )
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(builder: (context) {
                              return MusicFolderView();
                            })
                          );
                        }
                      )
                    ],
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        )
      )
    );
  }
}