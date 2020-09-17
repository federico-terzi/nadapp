import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/main.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:redux/redux.dart';

void navigationMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is PushNamed) {
    if (!action.reset) {
      navigatorKey.currentState.pushNamed(action.route);
    } else {
      navigatorKey.currentState.pushNamedAndRemoveUntil(action.route, (_) => false);
    }
  }

  next(action);
}