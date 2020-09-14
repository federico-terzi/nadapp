import 'dart:async';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:redux/redux.dart';

void loginMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoginRequest) {
    // TODO: replace with actual login
    Timer(Duration(seconds: 2), () => store.dispatch(LoginPhaseOneSuccess()));
  }

  next(action);
}