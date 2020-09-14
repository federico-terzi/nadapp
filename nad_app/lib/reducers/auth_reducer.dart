import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
  new TypedReducer<AuthState, LoginRequest>(loginRequestReducer),
  new TypedReducer<AuthState, LoginPhaseOneSuccess>(loginPhaseOneSuccessReducer),
]);

AuthState loginRequestReducer(AuthState auth, LoginRequest action) {
  return auth.copyWith(
    user: null,
    isLoading: true,

  );
}

AuthState loginPhaseOneSuccessReducer(AuthState auth, LoginPhaseOneSuccess action) {
  return auth.copyWith(
      isPhaseOneCompleted: true,
      isLoading: false,
  );
}

/*
AuthState userLoginFailureReducer(AuthState auth, UserLoginFailure action) {
  return auth.copyWith(
      isAuthenticated: false,
      isAuthenticating: false,
      error: action.error
  );
}

AuthState userLogoutReducer(AuthState auth, UserLogout action) {
    return new AuthState();
}
*/