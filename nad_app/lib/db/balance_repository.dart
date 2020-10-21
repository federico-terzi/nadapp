import 'package:nad_app/db/db.dart';
import 'package:nad_app/models/balance.dart';
import 'package:sqflite/sqflite.dart';

class BalanceRepository {
  final NadDatabase db;

  BalanceRepository(this.db);

  Future<void> saveBalance(Balance balance) async {
    var db = await this.db.get();
    await db.insert("balances", balance.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Balance>> getBalances() async {
    var db = await this.db.get();
    final List<Map<String, dynamic>> maps = await db.query('balances', orderBy: "date ASC");
    return List.generate(maps.length, (i) {
      return Balance.fromMap(maps[i]);
    });
  }

  Future<void> cleanBalances() async {
    var db = await this.db.get();
    await db.rawQuery("update balances set dirty=0");
  }

  Future<void> overrideBalances(List<Balance> balances) async {
    var db = await this.db.get();

    Batch batch = db.batch();
    batch.rawQuery("delete from balances");
    batch.rawQuery("delete from SQLITE_SEQUENCE WHERE name='balances'");
    balances.forEach((balance) {
      batch.insert("balances", balance.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
    await batch.commit();
  }

  Future<void> deleteAllBalances() async {
    var db = await this.db.get();
    await db.rawQuery("delete from balances");
  }
}