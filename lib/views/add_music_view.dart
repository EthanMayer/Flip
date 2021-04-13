import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';
import 'add_parts_view.dart';

class AddMusicView extends StatefulWidget {
  AddMusicView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Add Music class.
  @override
  _AddMusicViewState createState() => _AddMusicViewState();
}

/// Creates and manages the Account screen.
class _AddMusicViewState extends State<AddMusicView> {

  String _songName = "Song Name";
  String _scoreName = "Score PDF";

  _save() async {
    await FlipDatabase.instance.insertString(FlipDatabase.musicSongTable, _songName);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          // Navigation bar at the top of the screen that contains the view title and navigation buttons.
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Add Music',
              style: TextStyle(color: Styles.gold),
            ),
            previousPageTitle: "Home",
            // Right nav bar button, navigates to Account view.
            // trailing: CupertinoButton(
            //     child: Text(
            //       'Account',
            //       style: TextStyle(color: Styles.systemBlue),
            //     ),
            //     padding: EdgeInsets.all(10),
            //     // Navigates to Account View when pressed.
            //     onPressed: () {
            //       Navigator.push(
            //           context, CupertinoPageRoute(builder: (_) => AccountView()
            //       ));
            //     }),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 35.0, bottom: 0),
                    child: SizedBox(
                      width: 350,
                      child: CupertinoTextField(
                        //controller: ,TODO: Text controllers for text field values
                        placeholder: _songName,
                        placeholderStyle: Styles.textRowPlaceholder,
                        style: Styles.textRowPlaceholder,
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        padding: const EdgeInsets.only(
                            left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          color: CupertinoColors.white,
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        onChanged: (text) {
                          _songName = text;
                        },
                        onSubmitted: (text) {
                          _songName = text;
                        },
                      ),
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 25.0, bottom: 0),
                    child: SizedBox(
                      width: 350,
                      child: CupertinoButton(
                        child: Text(
                          _scoreName,
                          style: Styles.textRowPlaceholder,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        color: CupertinoColors.white,
                        onPressed: () {
                        //   _showUniversityPicker();
                        },
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 25.0, bottom: 0),
                  child: CupertinoButton(
                    child: Text(
                      'Next',
                      style: Styles.textButton,
                    ),
                    onPressed: () {
                      _save();
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => AddPartsView()
                      ));
                    },
                    borderRadius: BorderRadius.circular(25.0),
                    color: Styles.gold,
                    pressedOpacity: 0.75,
                  ),
                )
              ]
            )
          )
        ],
      )
    );
  }
}