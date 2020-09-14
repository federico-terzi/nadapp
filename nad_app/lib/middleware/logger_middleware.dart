import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:redux/redux.dart';

void loggerMiddleware(Store<AppState> store, action, NextDispatcher next) {
  print(action);

  next(action);
}