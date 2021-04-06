// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.


import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flip/main.dart';




void main() {
  const String NAME = "name";
  const String INSTRUMENT = "inst";
  const String UNIVERSITY = "univ";



  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Flip());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });


  test('name state should update',  () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(NAME, "test");
    expect(prefs.getString("name"), "test");

    prefs.setString(NAME, "");
    expect(prefs.getString("name"), "");

    prefs.setString(NAME, "David");
    expect(prefs.getString(NAME), "David");

  });


  test("instrument state should update", () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(INSTRUMENT, "Trombone");
    expect(prefs.getString(INSTRUMENT), "Trombone");

    prefs.setString(INSTRUMENT, "Flute");
    expect(prefs.getString(INSTRUMENT), "Flute");

    prefs.setString(INSTRUMENT, "Clarinet");
    expect(prefs.getString(INSTRUMENT), "Clarinet");

  });

  test("university state should update", () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(UNIVERSITY, "Vanderbilt");
    expect(prefs.getString(UNIVERSITY), "Vanderbilt");

    prefs.setString(UNIVERSITY, "Belmont");
    expect(prefs.getString(UNIVERSITY), "Belmont");

    prefs.setString(UNIVERSITY, "Trevecca");
    expect(prefs.getString(UNIVERSITY), "Trevecca");

  });



}


