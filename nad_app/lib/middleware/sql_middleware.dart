import 'dart:async';

import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/db/balance_repository.dart';
import 'package:nad_app/db/db.dart';
import 'package:nad_app/db/diary_repository.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

Middleware<AppState> createSqlMiddleware(NadDatabase db) {
  var diaryRepository = DiaryRepository(db);
  var balanceRepository = BalanceRepository(db);
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is AddMealRequest) {
      diaryRepository.saveMeal(action.meal).then((_) {
        store.dispatch(AddMealSuccess(meal: action.meal));
        store.dispatch(Pop());
      }).catchError((error) {
        // TODO: handle failure
      });
    } else if (action is SaveBalanceRequest) {
      balanceRepository.saveBalance(action.balance).then((_) {
        store.dispatch(SaveBalanceSuccess(balance: action.balance));
        if (action.isSubmit) {
          store.dispatch(Pop());
        }
      }).catchError((error) {
        // TODO: handle failure
      });
    }

    next(action);
  };
}