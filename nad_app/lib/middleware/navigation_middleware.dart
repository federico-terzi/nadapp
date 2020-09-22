import 'package:nad_app/actions/app_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/main.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/routes.dart';
import 'package:redux/redux.dart';

void navigationMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is PushNamed) {
    if (!action.reset) {
      navigatorKey.currentState.pushNamed(action.route);
    } else {
      navigatorKey.currentState.pushNamedAndRemoveUntil(action.route, (_) => false);
    }
  } else if (action is Pop) {
    navigatorKey.currentState.pop();
  } else if (action is AppInitialized) {
    if (action.state.auth.user != null) {
      // User is logged in, show the main screen
      store.dispatch(PushNamed(route: HOME_ROUTE, reset: true));

      // TODO: think about users that are not patients
    } else {
      // User is not logged in, show the intro
      store.dispatch(PushNamed(route: INTRO_ROUTE, reset: true));
    }
  }

  next(action);
}