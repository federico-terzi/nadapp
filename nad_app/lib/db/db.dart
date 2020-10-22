import 'package:sqflite/sqflite.dart';

const DB_NAME = "nadapp.db";

const MIGRATIONS = [
  '''
  CREATE TABLE "diary" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid"	TEXT NOT NULL UNIQUE,
    "date"	TEXT NOT NULL,
    "meal"	TEXT NOT NULL,
    "dirty"	INTEGER NOT NULL DEFAULT 0
  );
  ''',
  '''
  CREATE TABLE "balances" (
    "id"	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid"	TEXT NOT NULL UNIQUE,
    "date"	TEXT NOT NULL,
    "minPressure"	INTEGER,
    "maxPressure"	INTEGER,
    "heartFrequency"	INTEGER,
    "weight" REAL,
    "diuresis"	INTEGER,
    "fecesCount"	INTEGER,
    "fecesTexture"	TEXT,
    "ostomyVolume"	INTEGER,
    "pegVolume"	INTEGER,
    "otherGastrointestinalLosses"	TEXT,
    "parenteralNutritionVolume"	INTEGER,
    "otherIntravenousLiquids"	TEXT,
    "osLiquids"	INTEGER,
    "dirty"	INTEGER NOT NULL DEFAULT 0
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

