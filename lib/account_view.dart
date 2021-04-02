import 'package:flip/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tab_view.dart';
import 'styles.dart';

class AccountView extends StatefulWidget {
  AccountView({Key key}) : super(key: key);

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {

  String _name;
  String _university = "University";
  String _instrument = "Instrument";
  List<Text> _universityList = const [
    Text('Belmont', style: Styles.textRow),
    Text('Lipscomb', style: Styles.textRow),
    Text('Trevecca', style: Styles.textRow),
    Text('Nashville Tech', style: Styles.textRow),
    Text('Vanderbilt', style: Styles.textRow),
  ];
  List<Text> _instrumentList = const [
    Text('Bari Saxophone', style: Styles.textRow),
    Text('Bass Drum', style: Styles.textRow),
    Text('Clarinet', style: Styles.textRow),
    Text('Color Guard', style: Styles.textRow),
    Text('Cymbal', style: Styles.textRow),
    Text('Euphonium/Baritone', style: Styles.textRow),
    Text('Flute', style: Styles.textRow),
    Text('Mellophone', style: Styles.textRow),
    Text('Piccolo', style: Styles.textRow),
    Text('Saxophone', style: Styles.textRow),
    Text('Snare Drum', style: Styles.textRow),
    Text('Sousaphone', style: Styles.textRow),
    Text('Tenor Drum', style: Styles.textRow),
    Text('Tenor Saxophone', style: Styles.textRow),
    Text('Trombone', style: Styles.textRow),
    Text('Trumpet', style: Styles.textRow),
  ];

  @override
  void initState() {
    super.initState();
    _setup();
  }

  _setup() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "";
      _university = prefs.getString('university') ?? "University";
      _instrument = prefs.getString('instrument') ?? "Instrument";
    });

  }

  _updateName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _name);
  }

  _updateUniversity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('university', _university);
  }

  _updateInstrument() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('instrument', _instrument);
  }

  _showUniversityPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              child: CupertinoPicker(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                onSelectedItemChanged: (value) {
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

  _showInstrumentPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
              onSelectedItemChanged: (value) {
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Account'),
        leading: CupertinoButton(
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Styles.systemBlue,
                //fontSize: 25,
                //fontWeight: FontWeight.bold),
              ),
            ),
            padding: EdgeInsets.all(10),
            onPressed: () {
              Navigator.of(context).maybePop();
            }),
        trailing: CupertinoButton(
          child: Text(
            'Done',
            style: TextStyle(
                color: Styles.systemBlue,
                //fontSize: 25,
                //fontWeight: FontWeight.bold),
            ),
          ),
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.pushReplacement(
                context, CupertinoPageRoute(builder: (_) => TabView()
            ));
          }),
        ),
        child: SingleChildScrollView(
          child: Column(
              children: <Widget>[
                // Padding(
                //     padding: const EdgeInsets.only(top: 80.0),
                //     child: Center(
                //         child: Text(
                //           'Account',
                //           style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
                //         )
                //     )
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 90.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 150,
                        child: Image.asset('assets/images/starV_873.png')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, right: 30.0, top: 50.0, bottom: 0),
                  child: CupertinoTextField(
                    placeholder: _name,
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
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 30.0, right: 30.0, top: 25.0, bottom: 0),
                //   child: CupertinoTextField(
                //     placeholder: 'University',
                //     obscureText: true,
                //     placeholderStyle: Styles.textRowPlaceholder,
                //     style: Styles.textRowPlaceholder,
                //     padding: const EdgeInsets.only(
                //         left: 10.0, right: 0.0, top: 15.0, bottom: 15.0),
                //     decoration: BoxDecoration(
                //       color: CupertinoColors.white,
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //   ),
                // ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 25.0, bottom: 0),
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
                    )
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //       left: 30.0, right: 30.0, top: 25.0, bottom: 0),
                //   child: CupertinoTextField(
                //     placeholder: 'Instrument',
                //     placeholderStyle: Styles.textRowPlaceholder,
                //     style: Styles.textRowPlaceholder,
                //     padding: const EdgeInsets.only(
                //         left: 10.0, right: 0.0, top: 15.0, bottom: 15.0),
                //     decoration: BoxDecoration(
                //       color: CupertinoColors.white,
                //       borderRadius: BorderRadius.circular(25.0),
                //     ),
                //   ),
                // ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30.0, right: 30.0, top: 25.0, bottom: 0),
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
                )
              ),
              ]
          )
        )
    );
  }
}