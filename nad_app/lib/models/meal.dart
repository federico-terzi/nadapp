import 'package:flutter/widgets.dart';

@immutable
class Meal {
  final String uuid;
  final DateTime date;
  final String meal;

  final int dirty;

  Meal({this.uuid, this.date, this.meal, this.dirty = 0});

  Meal copyWith({
    String uuid,
    DateTime date,
    String meal,
    int dirty
  }) {
    return Meal(
      uuid: uuid ?? this.uuid,
      date: date ?? this.date,
      meal: meal ?? this.meal,
      dirty: dirty ?? this.dirty,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'date': date.toIso8601String(),
      'meal': meal,
      'dirty': dirty,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'uuid': uuid,
      'date': date.toIso8601String(),
      'meal': meal,
    };
  }

  Meal.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'],
        date = DateTime.parse(map['date']),
        meal = map['meal'],
        dirty = map['dirty'] ?? 0;

  @override
  String toString() {
    return 'Meal{uuid: $uuid, date: $date, meal: $meal, dirty: $dirty}';
  }
}