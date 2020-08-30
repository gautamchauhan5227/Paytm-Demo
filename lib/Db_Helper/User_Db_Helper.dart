import 'dart:async';
import 'package:paytm_demo/Model/User_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;



class DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String NUMBER = 'number';
  static const String PASSWORD = 'password';
  static const String TABLE = 'user';
  static const String DB_NAME = 'all_user.db';

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DB_NAME);
    var db = openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY AUTOINCREMENT,$NAME TEXT,$NUMBER TEXT,$PASSWORD TEXT)");
  }

  Future<User> save(User user) async {
    var dbClient = await db;
    user.id = await dbClient.insert(TABLE, user.toMap());
    return user;
  }

  Future<List<User>> getUser() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: [ID, NAME, NUMBER, PASSWORD]);


    List<User> users = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        users.add(User.fromMapObject(maps[i]));
      }
    }
    return users;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
