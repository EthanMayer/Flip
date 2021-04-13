import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip/utilities/styles.dart';
import 'package:flip/utilities/flip_database.dart';

class AddPartsView extends StatefulWidget {
  AddPartsView({Key key}) : super(key: key);

  /// Creates the dynamic state for the Add Music class.
  @override
  _AddPartsViewState createState() => _AddPartsViewState();
}

/// Creates and manages the Account screen.
class _AddPartsViewState extends State<AddPartsView> {

  String _scoreName = "Score PDF";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            // Navigation bar at the top of the screen that contains the view title and navigation buttons.
            CupertinoSliverNavigationBar(
              largeTitle: Text(
                'Add Parts',
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
                              placeholder: "Part Name",
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
                              // onSubmitted: (text) {
                              //   _name = text;
                              //   _updateName();
                              // },
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
                            'Finish',
                            style: Styles.textButton,
                          ),
                          onPressed: () {
                            //main();
                            //_validatePassword();
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