import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
//import 'todo.dart';

/// Handles SQLite database functions.
class FlipDatabase {

  // Database and table constants.
  static const _databaseName = "flip.db";
  static final _databaseVersion = 1;
  static Database _database;

  static const musicSongTable = 'music_song';
  static const musicInstrumentTable = 'music_instrument';
  static const musicFileTable = 'music_file';

  static const drillShowTable = 'drill_show';
  static const drillFileTable = 'drill_file';


  FlipDatabase._privateConstructor();
  static final FlipDatabase instance = FlipDatabase._privateConstructor();

  /// Grab the database if it exists or initialize it if it doesn't.
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  /// Initialize the database by grabbing the path if it exists or creating
  /// one it if it doesn't.
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: _onCreate, onConfigure: _onConfigure);
  }

  /// Executes SQL code to configure the database.
  Future _onConfigure(Database db) async {
    // Enable foreign key support (REFERENCES keyword in table creation).
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// Executes SQL code to create all tables needed in the database.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          BEGIN;
          
          CREATE TABLE $musicSongTable (
            music_song_id INTEGER PRIMARY KEY AUTOINCREMENT,
            music_song_name TEXT
          );
          
          CREATE TABLE $musicInstrumentTable (
            music_instrument_id INTEGER PRIMARY KEY AUTOINCREMENT,
            music_instrument_name TEXT,
            music_song_id INTEGER REFERENCES $musicSongTable(music_song_id)
          );
          
          CREATE TABLE $musicFileTable (
            music_file_id INTEGER PRIMARY KEY AUTOINCREMENT,
            music_file_name TEXT,
            music_file BLOB,
            music_instrument_id INTEGER REFERENCES $musicInstrumentTable(music_instrument_id)
          );
          
          CREATE TABLE $drillShowTable (
            drill_show_id INTEGER PRIMARY KEY AUTOINCREMENT,
            drill_show_name TEXT
          );
          
          CREATE TABLE $drillFileTable (
            drill_file_id INTEGER PRIMARY KEY AUTOINCREMENT,
            drill_file_name TEXT,
            drill_file BLOB,
            drill_show_id INTEGER REFERENCES $drillShowTable(drill_show_id)
          );
          
          COMMIT;
          ''');
  }

  /// Return the primary key column name for the table provided.
  String determinePrimaryKeyColumnName(String table) {
    switch(table) {
      case musicSongTable: {
        return "music_song_id";
      }
      case musicInstrumentTable: {
        return "music_instrument_id";
      }
      case musicFileTable: {
        return "music_file_id";
      }
      case drillShowTable: {
        return "drill_show_id";
      }
      case drillFileTable: {
        return "drill_file_id";
      }
      default: {
        return "NULL";
      }
    }
  }

  /// Return the primary key column name for the table provided.
  String determineTextColumnName(String table) {
    switch(table) {
      case musicSongTable: {
        return "music_song_name";
      }
      case musicInstrumentTable: {
        return "music_instrument_name";
      }
      case musicFileTable: {
        return "music_file_name";
      }
      case drillShowTable: {
        return "drill_show_name";
      }
      case drillFileTable: {
        return "drill_file_name";
      }
      default: {
        return "NULL";
      }
    }
  }

  /// Insert provided data into the specified table.
  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database;
    var id = await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  /// Delete provided row id in the specified table.
  Future<int> delete(String table, int id) async {
    Database db = await instance.database;
    String primaryKey = determinePrimaryKeyColumnName(table);
    var numDeleted = await db.delete(table, where: '$primaryKey = ?', whereArgs: [id]);
    return numDeleted;
  }

  /// Query a specified table to get a list ordered by the primary key.
  Future<List<Map<String, dynamic>>> query(String table) async {
    Database db = await instance.database;
    String primaryKey = determinePrimaryKeyColumnName(table);
    var items = await db.query(table, orderBy: "$primaryKey");
    return items;
  }

  /// Search a specified table to get a list.
  Future<List<Map<String, dynamic>>> search(String table, String keywords) async {
    Database db = await instance.database;
    String name = determineTextColumnName(table);
    var items = await db.query(table, where: '$name = ?', whereArgs: [keywords]);
    return items;
  }

  /// Clear an entire table.
  Future<void> clearTable(String table) async {
    Database db = await instance.database;
    var rows = await db.rawQuery("DELETE FROM $table");
    return rows;
  }

  Future<void> clearDatabase() async {
    Database db = await instance.database;
    var err = await db.rawQuery("""
      BEGIN;
      
      DROP TABLE $musicSongTable;
      DROP TABLE $musicInstrumentTable;
      DROP TABLE $musicFileTable;
      DROP TABLE $drillShowTable;
      DROP TABLE $drillFileTable;
      
      END;
      """);
  }
}