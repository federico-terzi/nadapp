import 'package:nad_app/actions/app_actions.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/reducers/auth_reducer.dart';
import 'package:nad_app/reducers/balance_reducer.dart';
import 'package:nad_app/reducers/doctor_reducer.dart';
import 'package:nad_app/reducers/meal_reducer.dart';
import 'package:nad_app/reducers/persistence_reducer.dart';
import 'package:nad_app/reducers/sync_reducer.dart';

import 'navigation_reducer.dart';

AppState rootReducer(AppState state, action) {
  if (action is AppInitialized) {
    return action.state;
  } else if (action is LogoutSuccess) {
    return AppState(); // Reset the state
  }

  return new AppState(
    auth: authReducer(state.auth, action),
    navigation: navigationReducer(state.navigation, action),
    meal: mealReducer(state.meal, action),
    balance: balanceReducer(state.balance, action),
    persistence: persistenceReducer(state.persistence, action),
    doctor: doctorReducer(state.doctor, action),
    sync: syncReducer(state.sync, action),
  );
}