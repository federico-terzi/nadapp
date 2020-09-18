import 'package:flutter/widgets.dart';

@immutable
class Meal {
  final DateTime date;
  final String meal;

  Meal({this.date, this.meal});

  @override
  String toString() {
    return 'Meal{date: $date, meal: $meal}';
  }
}