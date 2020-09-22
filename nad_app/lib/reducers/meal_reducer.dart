import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:redux/redux.dart';

Reducer<MealState> mealReducer = combineReducers([
  new TypedReducer<MealState, AddMealSuccess>(addMealSuccessReducer),
]);

MealState addMealSuccessReducer(MealState mealState, AddMealSuccess action) {
  return mealState.copyWith(
    // TODO: sort by date
    meals: List.from(mealState.meals)..add(action.meal),
  );
}