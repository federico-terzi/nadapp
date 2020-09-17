import 'package:meta/meta.dart';

import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/navigation_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final NavigationState navigation;

  AppState({AuthState auth, NavigationState navigation})
      : auth = auth ?? new AuthState(),
        navigation = navigation ?? new NavigationState();

  AppState copyWith({
    AuthState auth,
    NavigationState navigation,
  }) {
    return new AppState(
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
    );
  }
}
