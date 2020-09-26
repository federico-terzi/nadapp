import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:redux/redux.dart';

Reducer<MealState> mealReducer = combineReducers([
  new TypedReducer<MealState, AddMealSuccess>(addMealSuccessReducer),
]);

MealState addMealSuccessReducer(MealState mealState, AddMealSuccess action) {
  final List<Meal> newMeals = List.from(mealState.meals)..add(action.meal);
  newMeals.sort((m1, m2) => m1.date.compareTo(m2.date));
  return mealState.copyWith(
    meals: newMeals,
  );
}