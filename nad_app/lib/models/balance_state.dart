import 'package:meta/meta.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/utils/state_utils.dart';
import 'package:quiver/core.dart';

@immutable
class BalanceState {
  final List<Balance> balances;

  BalanceState({
    this.balances = const [],
  });

  BalanceState copyWith({
    List<Balance> balances,
  }) {
    return new BalanceState(
      balances: balances ?? this.balances,
    );
  }
}