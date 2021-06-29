import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tab_view.dart';
import 'package:flip/utilities/styles.dart';
import 'home_view.dart';

/// Manages dynamic state for the Account class.
class AccountView extends StatefulWidget {
  AccountView({Key key, this.first = false}) : super(key: key);
  final bool first;

  /// Creates the dynamic state for the Account class.
  @override
  _AccountViewState createState() => _AccountViewState(first);
}

/// Creates and manages the Account screen.
class _AccountViewState extends State<AccountView> {
  _AccountViewState(this._first);
  bool _first;

  // Variables to keep a local copy of data.
  String _name = "Name";
  String _university = "University";
  String _instrument = "Instrument";

  // Text controllers for input fields
  TextEditingController _nameController;

  // List of universities that can participate in the marching band.
  List<Text> _universityList = const [
    Text('Belmont', style: Styles.textRow),
    Text('Lipscomb', style: Styles.textRow),
    Text('Trevecca', style: Styles.textRow),
    Text('Nashville Tech', style: Styles.textRow),
    Text('Vanderbilt', style: Styles.textRow),
    Text('Vol. State', style: Styles.textRow),
    Text('Other', style: Styles.textRow),
  ];

  // List of instruments in the marching band.
  List<Text> _instrumentList = const [
    Text('Piccolo (Flute)', style: Styles.textRow),
    Text('Clarinet', style: Styles.textRow),
    Text('Alto Sax', style: Styles.textRow),
    Text('Tenor Sax', style: Styles.textRow),
    Text('Bari Sax', style: Styles.textRow),
    Text('Trumpet', style: Styles.textRow),
    Text('Mellophone', style: Styles.textRow),
    Text('Trombone', style: Styles.textRow),
    Text('Euphonium/Baritone (BC)', style: Styles.textRow),
    Text('Euphonium/Baritone (TC)', style: Styles.textRow),
    Text('Sousaphone', style: Styles.textRow),
    Text('Snare Drum', style: Styles.textRow),
    Text('Bass Drum', style: Styles.textRow),
    Text('Tenor Drums', style: Styles.textRow),
    Text('Cymbal', style: Styles.textRow),
    Text('Color Guard', style: Styles.textRow),
  ];

  /// Called on view load to initialize the screen view.
  @override
  void initState() {
    super.initState();
    _setup();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  /// Asynchronously access the phone preferences on view load to grab data.
  _setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "";
      _nameController = TextEditingController(
        text: _name,
      );
      _university = prefs.getString('university') ?? "University";
      _instrument = prefs.getString('instrument') ?? "Instrument";
    });
  }

  /// Asynchronously stores the name in the phone preferences.
  _updateName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name);
  }

  /// Asynchronously stores the university in the phone preferences.
  _updateUniversity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('university', _university);
  }

  /// Asynchronously stores the instrument in the phone preferences.
  _updateInstrument() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('instrument', _instrument);
  }

  /// Shows a scroll wheel-style picker in a bottom popup for universities.
  _showUniversityPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                onSelectedItemChanged: (value) {
                  // Called to refresh the UI to change the university text value.
                  setState(() {
                    _university = _universityList[value].data;
                    _updateUniversity();
                  });
                },
                itemExtent: 32.0,
                children: _universityList,
              )
          );
        });
  }

  /// Shows a scroll wheel-style picker in a bottom popup for instruments
  _showInstrumentPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              onSelectedItemChanged: (value) {
                // Called to refresh the UI to change the instrument text value.
                setState(() {
                  _instrument = _instrumentList[value].data;
                  _updateInstrument();
                });
              },
              itemExtent: 32.0,
              children: _instrumentList,
            )
          );
        });
  }

  /// Builds the UI using widgets.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text('Account'),
        // Left nav bar button, navigates to previous view.
        // leading: CupertinoButton(
        //     child: Text(
        //       'Cancel',
        //       style: TextStyle(
        //         color: Styles.systemBlue,
        //       ),
        //     ),
        //     padding: EdgeInsets.all(10),
        //     onPressed: () {
        //       Navigator.of(context).maybePop();
        //     }),
        // Right nav bar button, navigates to Home view.
        trailing: CupertinoButton(
          child: Text(
            'Done',
            style: TextStyle(
                color: Styles.systemBlue,
            ),
          ),
          padding: EdgeInsets.all(10),
          onPressed: () {
            if (!_first) {
              Navigator.of(context).maybePop();
            } else {
              Navigator.pushReplacement(
                  context, CupertinoPageRoute(builder: (_) => HomeView(conductor: false)
              ));
            }
          }),
        ),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                // Create the Star V image login page.
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/images/starV_873.png')),
                  ),
                ),
                // Create the name text field.
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, top: 50.0, bottom: 0),
                  child: SizedBox(
                    width: 350,
                    child: CupertinoTextField(
                      controller: _nameController,
                      placeholder: "Name",
                      placeholderStyle: Styles.textRowPlaceholder,
                      style: Styles.textRowPlaceholder,
                      textAlign: TextAlign.center,
                      padding: const EdgeInsets.only(
                          left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onSubmitted: (text) {
                        _name = text;
                        _updateName();
                      },
                    ),
                  )
                ),
                // Create the university text field/picker.
                Padding(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 25.0, bottom: 0),
                    child: SizedBox(
                      width: 350,
                      child: CupertinoButton(
                        child: Text(
                          _university,
                          style: Styles.textRowPlaceholder,
                        ),
                        borderRadius: BorderRadius.circular(25.0),
                        color: CupertinoColors.white,
                        onPressed: () {
                          _showUniversityPicker();
                        },
                      ),
                    )
                ),
                // Create the instrument text field/picker.
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30.0,
                      top: 25.0,
                      bottom: 0
                  ),
                  child: SizedBox(
                    width: 350,
                    child: CupertinoButton(
                      child: Text(
                        _instrument,
                        style: Styles.textRowPlaceholder,
                      ),
                      borderRadius: BorderRadius.circular(25.0),
                      color: CupertinoColors.white,
                      onPressed: () {
                        _showInstrumentPicker();
                      },
                    ),
                  )
                ),
              ]
          )
        )
    );
  }
}