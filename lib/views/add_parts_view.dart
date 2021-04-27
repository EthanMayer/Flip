import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'home_view.dart';

class AddPartsView extends StatefulWidget {
  AddPartsView({Key key, this.id}) : super(key: key);
  final int id;

  /// Creates the dynamic state for the Add Music class.
  @override
  _AddPartsViewState createState() => _AddPartsViewState(id);
}

/// Creates and manages the Account screen.
class _AddPartsViewState extends State<AddPartsView> {
  _AddPartsViewState(this.songID);
  final int songID;
  int partID;
  FlipDatabase db = FlipDatabase.instance;
  File file;

  String _partName = "Part Name";
  String _fileName = "Part PDF";

  _save() async {
    Map<String, dynamic> data = {
      "music_instrument_name" : _partName,
      "music_song_id" : songID
    };
    partID = await db.insert(FlipDatabase.musicInstrumentTable, data);

    Map<String, dynamic> data2 = {
      "music_file_name" : _partName + ".pdf",
      "music_file" : file.readAsBytesSync(),
      "music_instrument_id" : partID
    };
    await db.insert(FlipDatabase.musicFileTable, data2);
  }

  _getFiles() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf']);

    if(result != null) {
      file = File(result.files.first.path);
      setState(() {
        _fileName = file.path;
      });
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
                'Add Part',
                style: TextStyle(color: Styles.gold),
              ),
              previousPageTitle: "Add Music",
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
                              placeholder: _partName,
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
                                _partName = text;
                              },
                              onSubmitted: (text) {
                                _partName = text;
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
                            'Finish',
                            style: Styles.textButton,
                          ),
                          onPressed: () {
                            _save();
                            Navigator.pushReplacement(
                                context, CupertinoPageRoute(builder: (_) => HomeView(conductor: true,)
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