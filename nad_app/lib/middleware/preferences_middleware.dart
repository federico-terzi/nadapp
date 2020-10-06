import 'dart:async';
import 'dart:convert';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

const USER_PREFERENCE = "USER_PREFERENCE";
const MY_DOCTORS_PREFERENCE = "MY_DOCTORS_PREFERENCE";

void preferencesMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoginPhaseTwoSuccess) {
    SharedPreferences.getInstance().then((prefs) {
      String user = jsonEncode(action.user);
      prefs.setString(USER_PREFERENCE, user);
    });
  }

  next(action);
}
