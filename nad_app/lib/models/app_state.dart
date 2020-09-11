import 'package:meta/meta.dart';

import 'package:nad_app/models/auth_state.dart';

@immutable
class AppState {
  final AuthState auth;

  AppState({AuthState auth}):
        auth = auth ?? new AuthState();

  AppState copyWith({
    AuthState auth,
  }) {
    return new AppState(
        auth: auth ?? this.auth
    );
  }
}