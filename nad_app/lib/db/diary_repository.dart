import 'package:nad_app/db/db.dart';
import 'package:nad_app/models/meal.dart';
import 'package:sqflite/sqflite.dart';

class DiaryRepository {
  final NadDatabase db;

  DiaryRepository(this.db);

  Future<void> saveMeal(Meal meal) async {
    var db = await this.db.get();
    await db.insert("diary", meal.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Meal>> getMeals() async {
    var db = await this.db.get();
    final List<Map<String, dynamic>> maps = await db.query('diary', orderBy: "date ASC");
    return List.generate(maps.length, (i) {
      return Meal.fromMap(maps[i]);
    });
  }

  Future<void> cleanMeals() async {
    var db = await this.db.get();
    await db.rawQuery("update diary set dirty=0");
  }

  Future<void> overrideMeals(List<Meal> meals) async {
    var db = await this.db.get();

    Batch batch = db.batch();
    batch.rawQuery("delete from diary");
    batch.rawQuery("delete from SQLITE_SEQUENCE WHERE name='diary'");
    meals.forEach((meal) {
      batch.insert("diary", meal.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    });
    await batch.commit();
  }
}