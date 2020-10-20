import 'package:meta/meta.dart';

@immutable
class SyncState {
  final bool isSyncing;

  // Partial sync components
  final bool isDBSynced;
  final bool isPrefSynced;

  SyncState({
    this.isSyncing = false,
    this.isDBSynced = true,
    this.isPrefSynced = true,
  });

  SyncState copyWith({
    bool isSyncing,
    bool isDBSynced,
    bool isPrefSynced,
  }) {
    return new SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      isDBSynced: isDBSynced ?? this.isDBSynced,
      isPrefSynced: isPrefSynced ?? this.isPrefSynced,
    );
  }
}