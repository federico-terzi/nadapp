import 'package:meta/meta.dart';

import 'package:nad_app/models/user.dart';
import 'package:nad_app/utils/state_utils.dart';
import 'package:quiver/core.dart';

@immutable
class AuthState {
  final String verificationToken;
  final String sessionToken;

  final bool isPhaseOneCompleted;
  final bool isLoading;
  final String error;

  final bool logoutPreferenceCleared;
  final bool logoutDBCleared;

  AuthState({
    this.verificationToken,
    this.sessionToken,
    this.isPhaseOneCompleted = false,
    this.isLoading = false,
    this.error,
    this.logoutDBCleared = false,
    this.logoutPreferenceCleared = false,
  });

  AuthState copyWith({
    bool isPhaseOneCompleted,
    bool isLoading,
    Optional<String> error,
    User user,
    Optional<String> verificationToken,
    Optional<String> sessionToken,
    bool logoutDBCleared,
    bool logoutPreferenceCleared,
  }) {
    return new AuthState(
      isPhaseOneCompleted: isPhaseOneCompleted ?? this.isPhaseOneCompleted,
      isLoading: isLoading ?? this.isLoading,
      error: reduceState(error, this.error),
      verificationToken: reduceState(verificationToken, this.verificationToken),
      sessionToken: reduceState(sessionToken, this.sessionToken),
      logoutDBCleared: logoutDBCleared ?? this.logoutDBCleared,
      logoutPreferenceCleared: logoutPreferenceCleared ?? this.logoutPreferenceCleared,
    );
  }
}