import 'dart:convert';

import 'package:nad_app/db/db.dart';
import 'package:nad_app/db/diary_repository.dart';
import 'package:nad_app/middleware/preferences_middleware.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/balance.dart';
import 'models/user.dart';

Future<AppState> initializeState(NadDatabase db) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  AppState state = AppState();

  // Load the user if already logged in
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

  // Load the current balance
  String encodedCurrentBalance = prefs.getString(CURRENT_BALANCE_PREFERENCE);
  if (encodedCurrentBalance != null) {
    try {
      Balance currentBalance = Balance.fromJson(jsonDecode(encodedCurrentBalance));
      state = state.copyWith(balance: BalanceState(
        currentBalance: currentBalance,
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
  state = state.copyWith(meal: MealState(meals: meals));

  return state;
}