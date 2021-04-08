import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
//import 'todo.dart';

/// Handles SQLite database functions
class DatabaseHelper {

  // Database and table constants
  static final _databaseName = "flip.db";
  static final _databaseVersion = 1;
  static Database _database;

  static final musicSongTable = 'music_song';
  static final musicInstrumentTable = 'music_instrument';
  static final musicFileTable = 'music_file';

  static final drillShowTable = 'drill_show';
  static final drillFileTable = 'drill_file';


  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  /// Grab the database if it exists or initialize it if it doesn't
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _initDatabase();
      return _database;
    }
  }

  /// Initialize the database by grabbing the path if it exists or creating
  /// one it if it doesn't
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion,
        onCreate: _onCreate, onConfigure: _onConfigure);
  }

  /// Executes SQL code to configure the database
  Future _onConfigure(Database db) async {
    // Enable foreign key support (REFERENCES keyword in table creation)
    await db.execute('PRAGMA foreign_keys = ON');
  }

  /// Executes SQL code to create all tables needed in the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          BEGIN TRANSACTION;
          
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

  /// Insert provided data into the specified table
  Future<int> insert(String table, Map<String, dynamic> data) async {
    Database db = await instance.database;
    var id = await db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<int> delete(String table, int id) async {
    Database db = await instance.database;
    var numDeleted = await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    return numDeleted;
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var res = await db.query(table, orderBy: "$columnId DESC");
    return res;
  }
  
  Future<void> clearTable() async {
    Database db = await instance.database;
    return await db.rawQuery("DELETE FROM $table");
  }
}