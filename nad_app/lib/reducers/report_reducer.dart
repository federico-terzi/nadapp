import 'package:nad_app/actions/report_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/report.dart';
import 'package:nad_app/models/report_state.dart';
import 'package:quiver/core.dart';
import 'package:redux/redux.dart';

Reducer<ReportState> reportReducer = combineReducers([
  new TypedReducer<ReportState, SyncResponseReceived>(syncResponseReceivedReducer),
  new TypedReducer<ReportState, OpenReportRequest>(openReportRequestReducer),
  new TypedReducer<ReportState, OpenReportDownloaded>(openReportDownloadedReducer),
  new TypedReducer<ReportState, OpenReportError>(openReportErrorReducer),
]);

ReportState syncResponseReceivedReducer(ReportState reportState, SyncResponseReceived action) {
  if (action.response.reports == null) {
    return reportState;
  }

  final List<Report> newReports = List.from(action.response.reports);
  return reportState.copyWith(
    reports: newReports,
  );
}

ReportState openReportRequestReducer(ReportState reportState, OpenReportRequest action) {
  Set<int> newDownloadingSet = Set.from(reportState.downloadingReports)..add(action.id);
  return reportState.copyWith(
    downloadingReports: newDownloadingSet,
    error: Optional.absent(),
  );
}

ReportState openReportDownloadedReducer(ReportState reportState, OpenReportDownloaded action) {
  Set<int> newDownloadingSet = Set.from(reportState.downloadingReports)..remove(action.id);
  return reportState.copyWith(
    downloadingReports: newDownloadingSet,
    error: Optional.absent(),
  );
}

ReportState openReportErrorReducer(ReportState reportState, OpenReportError action) {
  Set<int> newDownloadingSet = Set.from(reportState.downloadingReports)..remove(action.id);
  return reportState.copyWith(
    downloadingReports: newDownloadingSet,
    error: Optional.of(action.error),
  );
}