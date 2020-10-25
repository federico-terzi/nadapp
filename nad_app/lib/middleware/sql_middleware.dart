import 'dart:async';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/db/balance_repository.dart';
import 'package:nad_app/db/db.dart';
import 'package:nad_app/db/diary_repository.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/sync_response.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';
import 'package:sqflite/sqflite.dart';

Future<void> _processSyncResponse(SyncResponse sync, DiaryRepository diaryRepository, BalanceRepository balanceRepository) async {
  if (sync.meals != null) {
    await diaryRepository.overrideMeals(sync.meals);
  }
  if (sync.balances != null) {
    await balanceRepository.overrideBalances(sync.balances);
  }
}

Future<void> _cleanDirtyEntries(DiaryRepository diaryRepository, BalanceRepository balanceRepository) async {
  await diaryRepository.cleanMeals();
  await balanceRepository.cleanBalances();
}

Future<void> _deleteAllEntries(DiaryRepository diaryRepository, BalanceRepository balanceRepository) async {
  await diaryRepository.deleteAllMeals();
  await balanceRepository.deleteAllBalances();
}

Middleware<AppState> createSqlMiddleware(NadDatabase db) {
  var diaryRepository = DiaryRepository(db);
  var balanceRepository = BalanceRepository(db);
  return (Store<AppState> store, action, NextDispatcher next) {
    if (action is AddMealRequest) {
      var dirtyMeal = action.meal.copyWith(dirty: 1);
      diaryRepository.saveMeal(dirtyMeal).then((_) {
        store.dispatch(AddMealSuccess(meal: dirtyMeal));
        store.dispatch(Pop());
        store.dispatch(RequestSync());
      }).catchError((error) {
        // TODO: handle failure
      });
    } else if (action is SaveBalanceRequest) {
      var dirtyBalance = action.balance.copyWith(dirty: 1);
      balanceRepository.saveBalance(dirtyBalance).then((_) {
        store.dispatch(SaveBalanceSuccess(balance: dirtyBalance));
        if (action.isSubmit) {
          store.dispatch(Pop());
        }
        store.dispatch(RequestSync());
      }).catchError((error) {
        // TODO: handle failure
      });
    } else if (action is SyncResponseReceived) {
      _processSyncResponse(action.response, diaryRepository, balanceRepository).then((_) {
        store.dispatch(DBSyncCompleted());
        store.dispatch(PartialSyncUpdated());
      }).catchError((err) {
        // TODO
      });
    } else if (action is LogoutRequest) {
      // Delete the DB entries only if the user explicitly requested a logout,
      // and not if that was caused by an expired session.
      if (action.requestedByUser) {
        _deleteAllEntries(diaryRepository, balanceRepository).then((_) {
          store.dispatch(LogoutDBCleared());
          store.dispatch(LogoutStatusUpdated());
        });
      } else {
        store.dispatch(LogoutDBCleared());
        store.dispatch(LogoutStatusUpdated());
      }
    } else if (action is SyncSuccess) {
      _cleanDirtyEntries(diaryRepository, balanceRepository);
    }

    next(action);
  };
}