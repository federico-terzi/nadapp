import 'package:meta/meta.dart';

import 'package:nad_app/models/user.dart';

import 'meal.dart';

@immutable
class MealState {
  final List<Meal> meals;

  MealState({
    this.meals = const [],
  });

  MealState copyWith({
    List<Meal> meals
  }) {
    return new MealState(
      meals: meals ?? this.meals,
    );
  }
}