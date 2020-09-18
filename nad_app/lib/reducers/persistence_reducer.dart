import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:redux/redux.dart';

Reducer<PersistenceState> persistenceReducer = combineReducers([
  new TypedReducer<PersistenceState, AddMealRequest>(addMealRequestReducer),
  new TypedReducer<PersistenceState, AddMealSuccess>(addMealSuccessReducer),
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