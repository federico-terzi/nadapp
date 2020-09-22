import 'package:flutter/widgets.dart';

@immutable
class Meal {
  final String uuid;
  final DateTime date;
  final String meal;

  Meal({this.uuid, this.date, this.meal});

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'date': date.millisecondsSinceEpoch,
      'meal': meal,
    };
  }

  Meal.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'],
        date = DateTime.fromMillisecondsSinceEpoch(map['date']),
        meal = map['meal'];

  @override
  String toString() {
    return 'Meal{uuid: $uuid, date: $date, meal: $meal}';
  }
}