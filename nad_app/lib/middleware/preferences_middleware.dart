import 'dart:async';
import 'dart:convert';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/sync_response.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/utils/pref_utils.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nad_app/models/doctor.dart';

Future<void> _processSyncResponse(SyncResponse sync) async {
  // TODO: save doctors
  await setLastServerEdit(sync.lastServerEdit);
}

void preferencesMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoginPhaseTwoSuccess) {
    setToken(action.token);
  } else if (action is SyncResponseReceived) {
    _processSyncResponse(action.response).then((_) {
      store.dispatch(PreferencesSyncCompleted());
      store.dispatch(PartialSyncUpdated());
    }).catchError((err) {
      // TODO
    });
  }

  next(action);
}
