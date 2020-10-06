import 'package:meta/meta.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/doctor_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/models/navigation_state.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:nad_app/models/sync_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final NavigationState navigation;
  final MealState meal;
  final BalanceState balance;
  final DoctorState doctor;
  final PersistenceState persistence;
  final SyncState sync;

  AppState(
      {AuthState auth,
      NavigationState navigation,
      MealState meal,
      BalanceState balance,
      DoctorState doctor,
      PersistenceState persistence,
      SyncState sync})
      : auth = auth ?? new AuthState(),
        navigation = navigation ?? new NavigationState(),
        meal = meal ?? new MealState(),
        balance = balance ?? new BalanceState(),
        doctor = doctor ?? new DoctorState(),
        persistence = persistence ?? new PersistenceState(),
        sync = sync ?? new SyncState();

  AppState copyWith({
    AuthState auth,
    NavigationState navigation,
    MealState meal,
    BalanceState balance,
    DoctorState doctor,
    PersistenceState persistence,
    SyncState sync,
  }) {
    return new AppState(
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
      meal: meal ?? this.meal,
      balance: balance ?? this.balance,
      doctor: doctor ?? this.doctor,
      persistence: persistence ?? this.persistence,
      sync: sync ?? this.sync,
    );
  }
}
