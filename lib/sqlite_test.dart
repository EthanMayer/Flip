import "package:flip/utilities/flip_database.dart";
import 'package:flutter_test/flutter_test.dart';
//import 'package:shared_preferences/shared_preferences.dart';

/// Test the SQLite functions in flip_database.dart to ensure backend functions as expected.
void main() {
  //TestWidgetsFlutterBinding.ensureInitialized();

  test('test inserting into database', () async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Dynamite'
    };

    int row = await FlipDatabase.instance.insert(FlipDatabase.musicSongTable, name);
    expect(row, 0);

    name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Anchors Aweigh'
    };

    row = await FlipDatabase.instance.insert(FlipDatabase.musicSongTable, name);
    expect(row, 1);
  });

  test('test searching from database', () async {
    Map<String, dynamic> name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Dynamite'
    };

    List<Map<String, dynamic>> row = await FlipDatabase.instance.search(
        FlipDatabase.musicSongTable, "Dynamite");
    List<Map<String, dynamic>> answer = [
      name
    ];

    expect(row, answer);
  });

  test('test querying from database', () async {
    Map<String, dynamic> name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Dynamite'
    };

    Map<String, dynamic> name2 = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Anchors Aweigh'
    };

    List<Map<String, dynamic>> row = await FlipDatabase.instance.query(
        FlipDatabase.musicSongTable);

    List<Map<String, dynamic>> answer = [
      name,
      name2
    ];

    expect(row, answer);
  });

  test('test deleting from database', () async {
    int row = await FlipDatabase.instance.delete(FlipDatabase.musicSongTable, 0);
    expect(row, 0);
  });

  test('test clearing database', () async {
    await FlipDatabase.instance.clearDatabase();
  });

}