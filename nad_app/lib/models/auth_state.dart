import 'package:meta/meta.dart';

import 'package:nad_app/models/user.dart';

@immutable
class AuthState {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final User user;
  final String error;

  AuthState({
    this.isAuthenticated = false,
    this.isAuthenticating = false,
    this.user,
    this.error,
  });

  // allows to modify AuthState parameters while cloning previous ones
  AuthState copyWith({
    bool isAuthenticated,
    bool isAuthenticating,
    String error,
    User user
  }) {
    return new AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isAuthenticating: isAuthenticating ?? this.isAuthenticating,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}