import 'package:nad_app/models/balance_state.dart';
import 'package:redux/redux.dart';

Reducer<BalanceState> balanceReducer = combineReducers([
  //new TypedReducer<BalanceState, AddMealSuccess>(addMealSuccessReducer),
]);

//BalanceState addMealSuccessReducer(BalanceState mealState, AddMealSuccess action) {
//  return mealState.copyWith(
//    meals: List.from(mealState.meals)..add(action.meal),
//  );
//}