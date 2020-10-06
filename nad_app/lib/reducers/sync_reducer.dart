import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/sync_state.dart';
import 'package:redux/redux.dart';

Reducer<SyncState> syncReducer = combineReducers([
  new TypedReducer<SyncState, RequestSync>(requestSyncReducer),
  new TypedReducer<SyncState, SyncSuccess>(syncSuccessfulReducer),
]);

SyncState requestSyncReducer(SyncState syncState, RequestSync action) {
  return syncState.copyWith(
    isSyncing: true,
  );
}

SyncState syncSuccessfulReducer(SyncState syncState, SyncSuccess action) {
  return syncState.copyWith(
    isSyncing: false,
  );
}

// TODO: handle sync unsuccessful