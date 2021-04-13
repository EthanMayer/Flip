import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';
import 'add_parts_view.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AddMusicView extends StatefulWidget {
  AddMusicView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Add Music class.
  @override
  _AddMusicViewState createState() => _AddMusicViewState();
}

/// Creates and manages the Account screen.
class _AddMusicViewState extends State<AddMusicView> {
  FlipDatabase db = FlipDatabase.instance;

  String _songName = "Song Name";
  String _fileName = "Score PDF";
  File file;

  Future<int> _save() async {
    Map<String, dynamic> data = {
      "music_song_name" : _songName,
      "score_file" : file
    };

    return await db.insert(FlipDatabase.musicSongTable, data);
  }

  _getFiles() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf']);

    if(result != null) {
      file = File(result.files.first.path);
    }
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
                          _fileName,
                          style: Styles.textRowPlaceholder,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        color: CupertinoColors.white,
                        onPressed: () {
                          _getFiles();
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
                    onPressed: () async {
                      int id = await _save();
                      Navigator.push(
                          context, CupertinoPageRoute(builder: (_) => AddPartsView(id: id)
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