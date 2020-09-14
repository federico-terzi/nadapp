import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/reducers/auth_reducer.dart';

AppState rootReducer(AppState state, action) {
  return new AppState(
    auth: authReducer(state.auth, action),
  );
}