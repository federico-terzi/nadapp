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
}