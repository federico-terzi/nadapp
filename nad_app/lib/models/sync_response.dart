import 'package:flutter/widgets.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/doctor.dart';

import 'meal.dart';

@immutable
class SyncResponse {
  final bool inSync;
  final int lastServerEdit;
  final List<Balance> balances;
  final List<Meal> meals;
  final List<Doctor> doctors;

  SyncResponse({this.inSync, this.lastServerEdit, this.balances, this.meals, this.doctors});

  SyncResponse.fromJson(Map<String, dynamic> json)
      : inSync = json["inSync"],
        lastServerEdit = json["lastServerEdit"],
        balances = json["balances"]?.map((balance) => Balance.fromMap(balance))?.cast<Balance>()?.toList(),
        meals = json["meals"]?.map((meal) => Meal.fromMap(meal))?.cast<Meal>()?.toList(),
        doctors = json["doctors"]?.map((doctor) => Doctor.fromMap(doctor))?.cast<Doctor>()?.toList();

  @override
  String toString() {
    return 'SyncResponse{inSync: $inSync, lastServerEdit: $lastServerEdit, balances: $balances, meals: $meals, doctors: $doctors}';
  }
}