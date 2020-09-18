import 'package:meta/meta.dart';

import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/models/navigation_state.dart';
import 'package:nad_app/models/persistence_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final NavigationState navigation;
  final MealState meal;
  final PersistenceState persistence;

  AppState({AuthState auth, NavigationState navigation, MealState meal, PersistenceState persistence})
      : auth = auth ?? new AuthState(),
        navigation = navigation ?? new NavigationState(),
        meal = meal ?? new MealState(),
        persistence = persistence ?? new PersistenceState();

  AppState copyWith({
    AuthState auth,
    NavigationState navigation,
    MealState meal,
    PersistenceState persistence,
  }) {
    return new AppState(
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
      meal: meal ?? this.meal,
      persistence:  persistence ?? this.persistence,
    );
  }
}
