import 'package:meta/meta.dart';

@immutable
class SyncState {
  final bool isSyncing;

  SyncState({
    this.isSyncing = false,
  });

  SyncState copyWith({
    bool isSyncing,
  }) {
    return new SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
    );
  }
}