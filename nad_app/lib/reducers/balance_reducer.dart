import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:redux/redux.dart';

Reducer<BalanceState> balanceReducer = combineReducers([
  new TypedReducer<BalanceState, AddBalanceSuccess>(addBalanceSuccessReducer),
  new TypedReducer<BalanceState, UpdateCurrentBalanceRequest>(updateCurrentBalanceRequestReducer),
]);

BalanceState addBalanceSuccessReducer(BalanceState balanceState, AddBalanceSuccess action) {
  return balanceState.copyWith(
    currentBalance: null,
    // TODO: sort by date
    balances: List.from(balanceState.balances)..add(action.balance),
  );
}

BalanceState updateCurrentBalanceRequestReducer(BalanceState balanceState, UpdateCurrentBalanceRequest action) {
  return balanceState.copyWith(
    currentBalance: action.balance
  );
}