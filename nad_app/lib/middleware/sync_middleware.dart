import 'dart:async';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/user.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';

void syncMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is RequestSync) {
    // TODO: replace with actual sync
    Timer(Duration(seconds: 2), () => store.dispatch(SyncSuccess()));
  }

  next(action);
}
