import 'package:flutter/material.dart';
import 'package:nad_app/models/balance.dart';

@immutable
class SaveBalanceRequest {
  final Balance balance;
  final bool isSubmit;

  SaveBalanceRequest({@required this.balance, this.isSubmit = false});

  @override
  String toString() {
    return 'SaveBalanceRequest{balance: $balance, isSubmit: $isSubmit}';
  }
}

@immutable
class SaveBalanceSuccess {
  final Balance balance;

  SaveBalanceSuccess({@required this.balance});

  @override
  String toString() {
    return 'SaveBalanceSuccess{balance: $balance}';
  }
}

//TODO: savebalancefailure