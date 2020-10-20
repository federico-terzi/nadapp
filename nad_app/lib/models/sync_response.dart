import 'package:flutter/widgets.dart';
import 'package:nad_app/models/balance.dart';

import 'meal.dart';

@immutable
class SyncResponse {
  final bool inSync;
  final int lastServerEdit;
  final List<Balance> balances;
  final List<Meal> meals;

  SyncResponse({this.inSync, this.lastServerEdit, this.balances, this.meals});

  SyncResponse.fromJson(Map<String, dynamic> json)
      : inSync = json["inSync"],
        lastServerEdit = json["lastServerEdit"],
        balances = json["balances"]?.map((balance) => Balance.fromMap(balance))?.cast<Balance>()?.toList(),
        meals = json["meals"]?.map((meal) => Meal.fromMap(meal))?.cast<Meal>()?.toList();

  @override
  String toString() {
    return 'SyncResponse{inSync: $inSync, lastServerEdit: $lastServerEdit, balances: $balances, meals: $meals}';
  }
}