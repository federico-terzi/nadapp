import 'package:meta/meta.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/doctor_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/models/navigation_state.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:nad_app/models/report_state.dart';
import 'package:nad_app/models/sync_state.dart';

@immutable
class AppState {
  final AuthState auth;
  final NavigationState navigation;
  final MealState meal;
  final BalanceState balance;
  final DoctorState doctor;
  final ReportState report;
  final PersistenceState persistence;
  final SyncState sync;

  AppState(
      {AuthState auth,
      NavigationState navigation,
      MealState meal,
      BalanceState balance,
      DoctorState doctor,
      ReportState report,
      PersistenceState persistence,
      SyncState sync})
      : auth = auth ?? new AuthState(),
        navigation = navigation ?? new NavigationState(),
        meal = meal ?? new MealState(),
        balance = balance ?? new BalanceState(),
        doctor = doctor ?? new DoctorState(),
        report = report ?? new ReportState(),
        persistence = persistence ?? new PersistenceState(),
        sync = sync ?? new SyncState();

  AppState copyWith({
    AuthState auth,
    NavigationState navigation,
    MealState meal,
    BalanceState balance,
    DoctorState doctor,
    ReportState report,
    PersistenceState persistence,
    SyncState sync,
  }) {
    return new AppState(
      auth: auth ?? this.auth,
      navigation: navigation ?? this.navigation,
      meal: meal ?? this.meal,
      balance: balance ?? this.balance,
      doctor: doctor ?? this.doctor,
      report: report ?? this.report,
      persistence: persistence ?? this.persistence,
      sync: sync ?? this.sync,
    );
  }
}
