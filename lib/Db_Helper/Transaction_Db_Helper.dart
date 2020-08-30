import 'dart:async';
import 'package:paytm_demo/Model/Transaction_Model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;



class Trasaction_DBHelper {
  static Database _db;
  static const String ID = 'id';
  static const String NUMBER = 'number';
  static const String TransactionId='transactionId';
  static const String TransactionMoney="transactionMoney";
  static const String TransactionTime="transactionTime";
  static const String TABLE = 'transactions';
  static const String DB_NAME = 'all_transaction.db';

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
        "CREATE TABLE $TABLE("
            "$ID INTEGER PRIMARY KEY AUTOINCREMENT,$NUMBER TEXT, $TransactionId TEXT,"
            "$TransactionMoney TEXT, $TransactionTime TEXT)");
  }

  Future<Transactions> save(Transactions transactions) async {
    var dbClient = await db;
    print(transactions.transactionID);
    transactions.id = await dbClient.insert(TABLE, transactions.toMap());
    print(transactions.transactionID);
    return transactions;
  }

  Future<List<Transactions>> getTransactions() async {
    var dbClient = await db;
    List<Map> maps = await dbClient
        .query(TABLE, columns: [ID, NUMBER,TransactionId ,TransactionMoney,TransactionTime]);


    List<Transactions> transactions = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        transactions.add(Transactions.fromMapObject(maps[i]));
      }
    }
    return transactions;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
