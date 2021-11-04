import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:virtualstocktrader/Data/User.dart';

class DBProvider {
  static final DBProvider db = DBProvider._();
  static Database? _database;
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "VSTDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Users "
              "(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "username TEXT NOT NULL,"
              "balance DOUBLE NOT NULL);");
          await db.execute("CREATE TABLE CurrentStocks "
              "(Code TEXT PRIMARY KEY NOT NULL,"
              "Name TEXT NOT NULL,"
              "Quantity INT NOT NULL,"
              "BuyingPrice DOUBLE NOT NULL,"
              "BuyingDateTS DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,"
              "BuyingDateTMZ TEXT NOT NULL,"
              "ActiveStock TEXT NOT NULL,"
              "SellingPrice Double"
              ");");
        });
  }

  Future<User> newUser(User newUser) async {
    final db = await database;
    var res = await db.insert("Users", newUser.toMap());
    return newUser;
  }
  Future<User> getUser(int id) async {
    final db = await database;
    var res = await  db.query("Users", where: "id = ?", whereArgs: [id]);
    return User.fromMap(res.first);
  }
  Future<User> updateUser(User newUser) async {
    final db = await database;
    var res = await db.update("Users", newUser.toMap(),
        where: "id = ?", whereArgs: [newUser.id]);
    return newUser;
  }

  checkUserExists() async {
    final db = await database;
    var res = await db.rawQuery("SELECT COUNT(id) from Users");
    return Sqflite.firstIntValue(res);
  }
  
  Future<User> getFirstUser() async {
    final db = await database;
    var res = await  db.rawQuery("SELECT * FROM Users ORDER BY id LIMIT 1");
    return User.fromMap(res.first);
  }
  Future close() async {
    final db = await database;
    db.close();
  }
}
