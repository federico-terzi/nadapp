import 'package:meta/meta.dart';

import 'package:nad_app/models/user.dart';

enum AuthPhase {
  NotLoggedIn,
  CredentialsVerified,
  TwoFactorVerified
}

@immutable
class AuthState {
  final User user;
  //final String refreshToken;
  //final String sessionToken;

  //final String phaseOneToken;
  final bool isPhaseOneCompleted;
  final bool isLoading;
  final String error;

  AuthState({
    //this.refreshToken,
    //this.sessionToken,
    //this.phaseOneToken,
    this.isPhaseOneCompleted = false,
    this.isLoading = false,
    this.user,
    this.error,
  });

  // allows to modify AuthState parameters while cloning previous ones
  AuthState copyWith({
    bool isPhaseOneCompleted,
    bool isLoading,
    String error,
    User user
  }) {
    return new AuthState(
      isPhaseOneCompleted: isPhaseOneCompleted ?? this.isPhaseOneCompleted,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }
}