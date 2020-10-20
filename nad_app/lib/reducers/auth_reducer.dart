import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:quiver/core.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers([
  new TypedReducer<AuthState, LoginRequest>(loginRequestReducer),
  new TypedReducer<AuthState, LoginPhaseOneSuccess>(
      loginPhaseOneSuccessReducer),
  new TypedReducer<AuthState, LoginPhaseOneFailed>(loginPhaseOneFailedReducer),
  new TypedReducer<AuthState, VerifyRequest>(verifyRequestReducer),
  new TypedReducer<AuthState, LoginPhaseTwoSuccess>(
      loginPhaseTwoSuccessReducer),
  new TypedReducer<AuthState, LoginPhaseTwoFailed>(loginPhaseTwoFailedReducer),
]);

AuthState loginRequestReducer(AuthState auth, LoginRequest action) {
  return auth.copyWith(
    user: null,
    isLoading: true,
    error: Optional.absent(),
  );
}

AuthState loginPhaseOneSuccessReducer(
    AuthState auth, LoginPhaseOneSuccess action) {
  return auth.copyWith(
    isPhaseOneCompleted: true,
    isLoading: false,
    verificationToken: Optional.of(action.verificationToken),
  );
}

AuthState loginPhaseOneFailedReducer(
    AuthState auth, LoginPhaseOneFailed action) {
  return auth.copyWith(
    isLoading: false,
    error: Optional.of(action.message),
  );
}

AuthState verifyRequestReducer(AuthState auth, VerifyRequest action) {
  return auth.copyWith(
    isLoading: true,
    error: Optional.absent(),
  );
}

AuthState loginPhaseTwoSuccessReducer(
    AuthState auth, LoginPhaseTwoSuccess action) {
  return auth.copyWith(
    isLoading: false,
    sessionToken: Optional.of(action.token),
    verificationToken: Optional.absent(),
  );
}

AuthState loginPhaseTwoFailedReducer(
    AuthState auth, LoginPhaseTwoFailed action) {
  return auth.copyWith(
    isLoading: false,
    error: Optional.of(action.message),
    isPhaseOneCompleted: false,
  );
}
