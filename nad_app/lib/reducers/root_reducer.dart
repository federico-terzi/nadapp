import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/reducers/auth_reducer.dart';
import 'package:nad_app/reducers/meal_reducer.dart';
import 'package:nad_app/reducers/persistence_reducer.dart';

import 'navigation_reducer.dart';

AppState rootReducer(AppState state, action) {
  return new AppState(
    auth: authReducer(state.auth, action),
    navigation: navigationReducer(state.navigation, action),
    meal: mealReducer(state.meal, action),
    persistence: persistenceReducer(state.persistence, action),
  );
}