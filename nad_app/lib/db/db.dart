import 'package:sqflite/sqflite.dart';

const DB_NAME = "nadapp.db";

const MIGRATIONS = [
  '''
  CREATE TABLE "diary" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid"	TEXT NOT NULL UNIQUE,
    "date"	INTEGER NOT NULL,
    "meal"	TEXT NOT NULL,
    "dirty"	INTEGER NOT NULL DEFAULT 1
  );
  ''',
  '''
  CREATE TABLE "balances" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid"	TEXT NOT NULL UNIQUE,
    "date"	INTEGER NOT NULL,
    "minPressure"	INTEGER NOT NULL,
    "maxPressure"	INTEGER NOT NULL,
    "heartFrequency"	INTEGER NOT NULL,
    "weight" REAL NOT NULL,
    "diuresis"	INTEGER NOT NULL,
    "fecesCount"	INTEGER,
    "fecesTexture"	TEXT,
    "ostomyVolume"	INTEGER,
    "pegVolume"	INTEGER,
    "otherGastrointestinalLosses"	TEXT,
    "parenteralNutritionVolume"	INTEGER,
    "otherIntravenousLiquids"	TEXT,
    "osLiquids"	INTEGER NOT NULL,
    "intravenousLiquidsVolume"	INTEGER NOT NULL,
    "dirty"	INTEGER NOT NULL DEFAULT 1
  );
  ''',
];

Future<Database> _openNadDatabase() async {
  Sqflite.setDebugModeOn(true);
  var db = await openDatabase(DB_NAME, version: MIGRATIONS.length,
    onCreate: (Database db, int version) async {
      MIGRATIONS.forEach((migration) async => await db.execute(migration));
    }, onUpgrade: (Database db, int oldVersion, int newVersion) async {
      for (var i = oldVersion; i < newVersion; i++) {
        await db.execute(MIGRATIONS[i]);
      }
    },
    singleInstance: true,
  );

  return db;
}

class NadDatabase {
  Database db;

  NadDatabase();

  initialize() async {
    if (this.db == null) {
      this.db = await _openNadDatabase();
    }
  }

  Future<Database> get() async {
    await initialize();
    return this.db;
  }
}

