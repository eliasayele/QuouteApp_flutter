import 'dart:async';

import 'package:life_hacks/models/Quotes.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String quoteTable = 'quoteTable';
  final String ownerId = 'ownerId';
  final String owner = 'owner';
  final String quote = 'quote';
  final String image = "image";

  static Database? _db;

  DatabaseHelper.internal();

  Future get db async {
    if (_db != null) {
      return _db;
    }
    print("database created");
    _db = await initDb();

    return _db;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'quotes.db');

//    await deleteDatabase(path); // just for testing

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $quoteTable($ownerId INTEGER PRIMARY KEY, $owner TEXT, $quote TEXT)');
    print("database created");
  }

  Future saveQuote(Quotes quote) async {
    var dbClient = await db;
    var result = await dbClient.insert(quoteTable, quote.toMap());
//    var result = await dbClient.rawInsert(
//        'INSERT INTO $tableNote ($columnTitle, $columnDescription) VALUES (\'${note.title}\', \'${note.description}\')');

    return result;
  }

  Future getAllQuotes() async {
    var dbClient = await db;
    var result = await dbClient
        .query(quoteTable, columns: [ownerId, owner, quote, image]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote');

    return result.toList();
  }

  Future getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $quoteTable'));
  }

  Future getQuote(int id) async {
    var dbClient = await db;
    List result = await dbClient.query(quoteTable,
        columns: [
          ownerId,
          quote,
        ],
        where: '$ownerId = ?',
        whereArgs: [ownerId]);
//    var result = await dbClient.rawQuery('SELECT * FROM $tableNote WHERE $columnId = $id');

    if (result.length > 0) {
      return new Quotes.fromMap(result.first);
    }

    return null;
  }

  Future deleteQuote(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(quoteTable, where: '$ownerId = ?', whereArgs: [ownerId]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }

//   Future updateQuote(Quotes quote) async {
//     var dbClient = await db;
//     return await dbClient.update(quoteTable, quote.toMap(),
//         where: "$ownerId = ?", whereArgs: [quote.ownerId]);
// //    return await dbClient.rawUpdate(
// //        'UPDATE $tableNote SET $columnTitle = \'${note.title}\', $columnDescription = \'${note.description}\' WHERE $columnId = ${note.id}');
//   }

  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
