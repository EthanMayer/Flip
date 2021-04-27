import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';
import 'home_view.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class AddDrillView extends StatefulWidget {
  AddDrillView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Add Music class.
  @override
  _AddDrillViewState createState() => _AddDrillViewState();
}

/// Creates and manages the Account screen.
class _AddDrillViewState extends State<AddDrillView> {
  FlipDatabase db = FlipDatabase.instance;

  String _showName = "Show Name";
  String _fileName = "Drill Sheet PDF";
  File file;
  int showID;

  Future<void> _save() async {
    Map<String, dynamic> data = {
      "drill_show_name" : _showName,
    };

    showID = await db.insert(FlipDatabase.drillShowTable, data);

    Map<String, dynamic> data2 = {
      "drill_file_name" : _showName + ".pdf",
      "drill_file" : file.readAsBytesSync(),
      "drill_show_id" : showID
    };
    await db.insert(FlipDatabase.drillFileTable, data2);
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
                'Add Drill',
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
                              placeholder: _showName,
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
                                _showName = text;
                              },
                              onSubmitted: (text) {
                                _showName = text;
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
                                context, CupertinoPageRoute(builder: (_) => HomeView(conductor: true)
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