import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/sync_response.dart';

class RequestSync {}

class SyncResponseReceived {
  final SyncResponse response;

  SyncResponseReceived({this.response});

  @override
  String toString() {
    return 'SyncResponseReceived{response: $response}';
  }
}

class DBSyncCompleted {}
class PreferencesSyncCompleted {}

class PartialSyncUpdated {}

class SyncSuccess {}
class SyncError {
  final String error;

  SyncError({this.error});

  @override
  String toString() {
    return 'SyncError{error: $error}';
  }
}