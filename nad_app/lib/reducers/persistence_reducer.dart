import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:redux/redux.dart';

Reducer<PersistenceState> persistenceReducer = combineReducers([
  new TypedReducer<PersistenceState, AddMealRequest>(addMealRequestReducer),
  new TypedReducer<PersistenceState, AddMealSuccess>(addMealSuccessReducer),
  new TypedReducer<PersistenceState, SaveBalanceRequest>(saveBalanceRequestReducer),
  new TypedReducer<PersistenceState, SaveBalanceSuccess>(saveBalanceSuccessReducer),
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

PersistenceState saveBalanceRequestReducer(PersistenceState navigationState, SaveBalanceRequest action) {
  return navigationState.copyWith(
    isSaving: true,
  );
}

PersistenceState saveBalanceSuccessReducer(PersistenceState navigationState, SaveBalanceSuccess action) {
  return navigationState.copyWith(
    isSaving: false,
  );
}