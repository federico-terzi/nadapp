import 'package:meta/meta.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/utils/state_utils.dart';
import 'package:quiver/core.dart';

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
    Optional<Balance> currentBalance,
  }) {
    return new BalanceState(
      balances: balances ?? this.balances,
      currentBalance: reduceState(currentBalance, this.currentBalance),
    );
  }
}