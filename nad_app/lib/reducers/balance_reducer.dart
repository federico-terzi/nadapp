import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:quiver/core.dart';
import 'package:redux/redux.dart';

Reducer<BalanceState> balanceReducer = combineReducers([
  new TypedReducer<BalanceState, AddBalanceSuccess>(addBalanceSuccessReducer),
  new TypedReducer<BalanceState, UpdateCurrentBalanceRequest>(updateCurrentBalanceRequestReducer),
]);

BalanceState addBalanceSuccessReducer(BalanceState balanceState, AddBalanceSuccess action) {
  final List<Balance> newBalances = List.from(balanceState.balances)..add(action.balance);
  newBalances.sort((b1, b2) => b1.date.compareTo(b2.date));

  return balanceState.copyWith(
    currentBalance: Optional.absent(),
    balances: newBalances,
  );
}

BalanceState updateCurrentBalanceRequestReducer(BalanceState balanceState, UpdateCurrentBalanceRequest action) {
  return balanceState.copyWith(
    currentBalance: Optional.of(action.balance)
  );
}