import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/sync_state.dart';
import 'package:redux/redux.dart';

Reducer<SyncState> syncReducer = combineReducers([
  new TypedReducer<SyncState, RequestSync>(requestSyncReducer),
  new TypedReducer<SyncState, SyncSuccess>(syncSuccessfulReducer),
  new TypedReducer<SyncState, PreferencesSyncCompleted>(preferencesSyncCompletedReducer),
  new TypedReducer<SyncState, DBSyncCompleted>(dbSyncCompletedReducer),
]);

SyncState requestSyncReducer(SyncState syncState, RequestSync action) {
  return syncState.copyWith(
    isSyncing: true,
    isDBSynced: false,
    isPrefSynced: false,
  );
}

SyncState syncSuccessfulReducer(SyncState syncState, SyncSuccess action) {
  return syncState.copyWith(
    isSyncing: false,
    isDBSynced: true,
    isPrefSynced: true,
  );
}

SyncState dbSyncCompletedReducer(SyncState syncState, DBSyncCompleted action) {
  return syncState.copyWith(
    isDBSynced: true,
  );
}

SyncState preferencesSyncCompletedReducer(SyncState syncState, PreferencesSyncCompleted action) {
  return syncState.copyWith(
    isPrefSynced: true,
  );
}

// TODO: handle sync unsuccessful