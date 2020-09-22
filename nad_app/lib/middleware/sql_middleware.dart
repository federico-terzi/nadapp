import 'dart:async';

import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/db/db.dart';
import 'package:nad_app/db/diary_repository.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

Middleware<AppState> createSqlMiddleware(NadDatabase db) {
  var diaryRepository = DiaryRepository(db);
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is AddMealRequest) {
      diaryRepository.saveMeal(action.meal).then((_) {
        store.dispatch(AddMealSuccess(meal: action.meal));
        store.dispatch(Pop());
      }).catchError((error) {
        // TODO: handle failure
      });
    } else if (action is AddBalanceRequest) {
      // TODO: save balance in SQLite db
      Timer(Duration(seconds: 1), () => {
        store.dispatch(AddBalanceSuccess(balance: action.balance)),
        store.dispatch(Pop()),
      });
    }

    next(action);
  };
}