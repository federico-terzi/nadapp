import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:redux/redux.dart';

Reducer<PersistenceState> persistenceReducer = combineReducers([
  new TypedReducer<PersistenceState, AddMealRequest>(addMealRequestReducer),
  new TypedReducer<PersistenceState, AddMealSuccess>(addMealSuccessReducer),
  new TypedReducer<PersistenceState, AddBalanceRequest>(addBalanceRequestReducer),
  new TypedReducer<PersistenceState, AddBalanceSuccess>(addBalanceSuccessReducer),
]);

PersistenceState addMealRequestReducer(PersistenceState navigationState, AddMealRequest action) {
  return navigationState.copyWith(
    isSaving: true,
  );
}

PersistenceState addMealSuccessReducer(PersistenceState navigationState, AddMealSuccess action) {
  return navigationState.copyWith(
    isSaving: false,
  );
}

PersistenceState addBalanceRequestReducer(PersistenceState navigationState, AddBalanceRequest action) {
  return navigationState.copyWith(
    isSaving: true,
  );
}

PersistenceState addBalanceSuccessReducer(PersistenceState navigationState, AddBalanceSuccess action) {
  return navigationState.copyWith(
    isSaving: false,
  );
}