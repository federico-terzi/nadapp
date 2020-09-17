import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/models/navigation_state.dart';
import 'package:redux/redux.dart';

Reducer<NavigationState> authReducer = combineReducers([
  new TypedReducer<NavigationState, PushNamed>(pushNamedReducer),
]);

NavigationState pushNamedReducer(NavigationState navigationState, PushNamed action) {
  return navigationState.copyWith(
    redirectTo: action.route,
  );
}