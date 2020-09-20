import 'package:meta/meta.dart';
import 'package:nad_app/models/balance.dart';

@immutable
class BalanceState {
  final List<Balance> balances;
  final Balance currentBalance;

  BalanceState({
    this.balances = const [],
    this.currentBalance,
  });

  BalanceState copyWith({
    List<Balance> balances,
    Balance currentBalance,
  }) {
    return new BalanceState(
      balances: balances ?? this.balances,
      currentBalance: currentBalance ?? this.currentBalance,
    );
  }
}