import 'dart:async';

import 'package:flutter_app/Class/noted.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableProfile = 'profileTable';
  final String columnId = 'id';
  final String columnname = 'name';
  final String columnimagename = 'imagename';
  final String columnimagepath = 'imagepath';

  static Database _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'myexpense.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableProfile($columnId INTEGER PRIMARY KEY, $columnname TEXT, $columnimagename TEXT, $columnimagepath TEXT)');
  }

  Future<int> saveProfile(Profile note) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableProfile, note.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future<List> getAllProfile() async {
    var dbClient = await db;
    var result = await dbClient
        .query(tableProfile, columns: [columnId, columnname, columnimagename, columnimagepath]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }

  Future<int> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableProfile'));
  }

  Future<Profile> getProfile(int id) async {
    var dbClient = await db;
    List<Map> result = await dbClient.query(tableProfile,
        columns: [columnId, columnname, columnimagename ,columnimagepath],
        where: '$columnId = ?',
        whereArgs: [id]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Profile.fromMap(result.first);
    }

    return null;
  }

  Future<int> deleteProfile(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableProfile, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

  Future<int> updateProfile(Profile note) async {
    var dbClient = await db;
    return await dbClient.update(tableProfile, note.toMap(),
        where: "$columnId = ?", whereArgs: [note.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
  }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
