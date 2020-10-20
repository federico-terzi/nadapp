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
import 'models/user.dart';

Future<AppState> initializeState(NadDatabase db) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppState state = AppState();

  // Load the user if already logged in
  /* TODO
  String encodedUser = prefs.getString(USER_PREFERENCE);
  if (encodedUser != null) {
    try {
      User user = User.fromJson(jsonDecode(encodedUser));
      state = state.copyWith(auth: AuthState(
        isPhaseOneCompleted: true,
        isLoading: false,
        user: user,
      ));
    }catch(e) {
      print(e);
    }
  }
   */
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
  String encodedMyDoctors = prefs.getString(MY_DOCTORS_PREFERENCE);
  if (encodedMyDoctors != null) {
    try {
      List jsonDoctors = json.decode(encodedMyDoctors);
      List<Doctor> doctors = jsonDoctors.map((item) => Doctor.fromMap(item)).toList();
      state = state.copyWith(doctor: state.doctor.copyWith(
        doctors: doctors,
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