import 'dart:async';

import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:redux/redux.dart';

void persistenceMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is AddMealRequest) {
    // TODO: save meal in SQLite db
    Timer(Duration(seconds: 1), () => store.dispatch(AddMealSuccess(meal: action.meal)));
    // TODO: consider case of failure
  }

  next(action);
}
