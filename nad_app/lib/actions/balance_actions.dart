import 'package:flutter/material.dart';
import 'package:nad_app/models/balance.dart';

@immutable
class AddBalanceRequest {
  final Balance balance;

  AddBalanceRequest({@required this.balance});

  @override
  String toString() {
    return 'AddBalanceRequest{balance: $balance}';
  }
}

@immutable
class AddBalanceSuccess {
  final Balance balance;

  AddBalanceSuccess({@required this.balance});

  @override
  String toString() {
    return 'AddBalanceSuccess{balance: $balance}';
  }
}

//TODO: addbalancefailure

@immutable
class UpdateCurrentBalanceRequest {
  final Balance balance;

  UpdateCurrentBalanceRequest({@required this.balance});

  @override
  String toString() {
    return 'UpdateCurrentBalanceRequest{balance: $balance}';
  }
}