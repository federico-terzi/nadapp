import 'package:flutter/material.dart';
import 'package:nad_app/models/meal.dart';

@immutable
class AddMealRequest {
  final Meal meal;

  AddMealRequest({@required this.meal});

  @override
  String toString() {
    return 'AddMealRequest{meal: $meal}';
  }
}

@immutable
class AddMealSuccess {
  final Meal meal;

  AddMealSuccess({@required this.meal});

  @override
  String toString() {
    return 'AddMealSuccess{meal: $meal}';
  }
}

// TODO: AddMeal failure