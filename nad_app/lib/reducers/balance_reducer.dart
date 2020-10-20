import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:quiver/core.dart';
import 'package:redux/redux.dart';

Reducer<BalanceState> balanceReducer = combineReducers([
  new TypedReducer<BalanceState, SaveBalanceSuccess>(saveBalanceSuccessReducer),
  new TypedReducer<BalanceState, SyncResponseReceived>(
      syncResponseReceivedReducer),
  new TypedReducer<BalanceState, SyncSuccess>(syncSuccessReducer),
]);

BalanceState saveBalanceSuccessReducer(
    BalanceState balanceState, SaveBalanceSuccess action) {
  List<Balance> newBalances = List.from(balanceState.balances);

  // If the saved balance is already in the list, update it. Otherwise
  // add it to the list
  int index;
  for (int i = 0; i < newBalances.length; i++) {
    if (newBalances[i].uuid == action.balance.uuid) {
      index = i;
      break;
    }
  }
  if (index != null) {
    newBalances[index] = action.balance;
  } else {
    newBalances.add(action.balance);
  }

  newBalances.sort((b1, b2) => b1.date.compareTo(b2.date));

  return balanceState.copyWith(
    balances: newBalances,
  );
}

BalanceState syncResponseReceivedReducer(
    BalanceState balanceState, SyncResponseReceived action) {
  if (action.response.balances == null) {
    return balanceState;
  }

  List<Balance> newBalances = List.from(action.response.balances);
  newBalances.sort((b1, b2) => b1.date.compareTo(b2.date));

  return balanceState.copyWith(
    balances: newBalances,
  );
}

BalanceState syncSuccessReducer(BalanceState balanceState, SyncSuccess action) {
  List<Balance> newBalances = balanceState.balances
      .map((balance) => balance.copyWith(dirty: 0))
      .toList();

  return balanceState.copyWith(
    balances: newBalances,
  );
}
