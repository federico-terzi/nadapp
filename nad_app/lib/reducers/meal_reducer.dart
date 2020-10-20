import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:redux/redux.dart';

Reducer<MealState> mealReducer = combineReducers([
  new TypedReducer<MealState, AddMealSuccess>(addMealSuccessReducer),
  new TypedReducer<MealState, SyncResponseReceived>(syncResponseReceivedReducer),
  new TypedReducer<MealState, SyncSuccess>(syncSuccessReducer),
]);

MealState addMealSuccessReducer(MealState mealState, AddMealSuccess action) {
  final List<Meal> newMeals = List.from(mealState.meals)..add(action.meal);
  newMeals.sort((m1, m2) => m1.date.compareTo(m2.date));
  return mealState.copyWith(
    meals: newMeals,
  );
}

MealState syncResponseReceivedReducer(MealState mealState, SyncResponseReceived action) {
  if (action.response.meals == null) {
    return mealState;
  }

  final List<Meal> newMeals = List.from(action.response.meals);
  newMeals.sort((m1, m2) => m1.date.compareTo(m2.date));
  return mealState.copyWith(
    meals: newMeals,
  );
}

MealState syncSuccessReducer(MealState mealState, SyncSuccess action) {
  final List<Meal> newMeals = mealState.meals.map((meal) => meal.copyWith(dirty: 0)).toList();
  return mealState.copyWith(
    meals: newMeals,
  );
}