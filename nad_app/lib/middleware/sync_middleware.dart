import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/sync_response.dart';
import 'package:nad_app/models/user.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/server_config.dart';
import 'package:nad_app/utils/pref_utils.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

Future<SyncResponse> _requestSync(AppState state, String sessionToken) async {
  int lastServerEdit = await getLastServerEdit();


  Map<String, dynamic> body = Map();
  body["lastServerEdit"] = lastServerEdit;

  var dirtyBalances = getDirtyBalances(state);
  if (dirtyBalances.length > 0) {
    body["balances"] = dirtyBalances.map((balance) => balance.toJson()).toList();
  }
  var dirtyMeals = getDirtyMeals(state);
  if (dirtyMeals.length > 0) {
    body["meals"] = dirtyMeals.map((meal) => meal.toJson()).toList();
  }

  http.Response res = await http
      .post(SYNC_ENDPOINT,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Authorization": "Bearer $sessionToken",
      },
      body: jsonEncode(body))
      .timeout(const Duration(seconds: 5));
  print("server response ${res.body}");
  SyncResponse syncResponse = SyncResponse.fromJson(jsonDecode(res.body));
  return syncResponse;
}

List<Balance> getDirtyBalances(AppState state) {
  return state.balance.balances.where((balance) => balance.dirty == 1).toList();
}

List<Meal> getDirtyMeals(AppState state) {
  return state.meal.meals.where((meal) => meal.dirty == 1).toList();
}

void syncMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is RequestSync) {
    if (!store.state.sync.isSyncing) {
      _requestSync(store.state, store.state.auth.sessionToken).then((syncResponse) {
        if (syncResponse.inSync) {
          store.dispatch(SyncSuccess());
        } else {
          store.dispatch(SyncResponseReceived(response: syncResponse));
        }
      }).catchError((err) {
        print("requestSync error $err");
        store.dispatch(SyncError(error: "Impossible completare la sincronizzazione, riprova più tardi"));
      });
    }
  } else if (action is PartialSyncUpdated) {
    if (store.state.sync.isPrefSynced && store.state.sync.isDBSynced) {
      // All the intermediate modules are completed, trigger the success action
      store.dispatch(SyncSuccess());
    }
  }

  next(action);
}
