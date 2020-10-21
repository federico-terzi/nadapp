import 'package:meta/meta.dart';
import 'package:nad_app/utils/state_utils.dart';
import 'package:quiver/core.dart';

@immutable
class SyncState {
  final bool isSyncing;
  final String error;

  // Partial sync components
  final bool isDBSynced;
  final bool isPrefSynced;

  SyncState({
    this.isSyncing = false,
    this.isDBSynced = true,
    this.isPrefSynced = true,
    this.error,
  });

  SyncState copyWith({
    bool isSyncing,
    bool isDBSynced,
    bool isPrefSynced,
    Optional<String> error,
  }) {
    return new SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      isDBSynced: isDBSynced ?? this.isDBSynced,
      isPrefSynced: isPrefSynced ?? this.isPrefSynced,
      error: reduceState(error, this.error),
    );
  }
}