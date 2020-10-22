import 'dart:convert';

import 'package:nad_app/db/balance_repository.dart';
import 'package:nad_app/db/db.dart';
import 'package:nad_app/db/diary_repository.dart';
import 'package:nad_app/middleware/preferences_middleware.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/utils/pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/balance.dart';
import 'models/doctor.dart';
import 'models/report.dart';
import 'models/user.dart';

Future<AppState> initializeState(NadDatabase db) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppState state = AppState();

  // Load the token if already logged in
  String sessionToken = await getToken();
  if (sessionToken != null) {
    try {
      state = state.copyWith(auth: AuthState(
        isPhaseOneCompleted: true,
        isLoading: false,
        sessionToken: sessionToken,
      ));
    }catch(e) {
      print(e);
    }
  }

  // Load "my doctors" from preferences
  List<Doctor> myDoctors = await getDoctors();
  if (myDoctors != null) {
    try {
      state = state.copyWith(doctor: state.doctor.copyWith(
        doctors: myDoctors,
      ));
    }catch(e) {
      print(e);
    }
  }

  // Load reports from preferences
  List<Report> reports = await getReports();
  if (reports != null) {
    try {
      state = state.copyWith(report: state.report.copyWith(
        reports: reports,
      ));
    }catch(e) {
      print(e);
    }
  }

  // Initialize the DB
  await db.initialize();

  // Load the SQLite data to app state
  var diaryRepository = DiaryRepository(db);
  var meals = await diaryRepository.getMeals();
  state = state.copyWith(meal: state.meal.copyWith(meals: meals));

  var balanceRepository = BalanceRepository(db);
  var balances = await balanceRepository.getBalances();
  state = state.copyWith(balance: state.balance.copyWith(balances: balances));

  return state;
}