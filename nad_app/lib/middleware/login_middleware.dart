import 'dart:async';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/user.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';

void loginMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoginRequest) {
    // TODO: replace with actual login
    Timer(Duration(seconds: 2), () => store.dispatch(LoginPhaseOneSuccess()));
  } else if (action is VerifyRequest) {
    // TODO: replace with actual verification
    Timer(
        Duration(seconds: 2),
        () => {
              store.dispatch(LoginPhaseTwoSuccess(
                user: User(username: "mario.rossi", name: "Mario"),
              )),
              store.dispatch(PushNamed(route: HOME_ROUTE, reset: true))
            });
  }

  next(action);
}
