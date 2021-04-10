import "package:flip/utilities/Database.dart";
import 'package:flutter_test/flutter_test.dart';

/// Test the SQLite functions in Database.dart to ensure backend functions as expected.
void main() {
  test('test inserting into database', () async {
    Map<String, dynamic> name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Dynamite'
    };

    int row = await FlipDatabase.instance.insert(FlipDatabase.musicFileTable, name);
    expect(row, 0);

    name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Anchors Aweigh'
    };

    row = await FlipDatabase.instance.insert(FlipDatabase.musicFileTable, name);
    expect(row, 1);
  });

  test('test searching from database', () async {
    Map<String, dynamic> name = {
      FlipDatabase.instance.determineTextColumnName(FlipDatabase.musicSongTable)
          : 'Dynamite'
    };

    int row = await FlipDatabase.instance.delete(FlipDatabase.musicFileTable, name);
    expect(row, 0);
  });

  // Clear database after testing is complete
  FlipDatabase.instance.clearDatabase();
}