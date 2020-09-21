import 'dart:async';

import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';

void preferencesMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is UpdateCurrentBalanceRequest) {
    // TODO: save current balance from preferences
  } else if (action is AddBalanceSuccess) {
    // TODO: Remove current balance from preferences
  }

  next(action);
}
