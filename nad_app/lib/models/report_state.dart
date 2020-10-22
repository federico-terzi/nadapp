import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nad_app/models/report.dart';
import 'package:nad_app/utils/state_utils.dart';
import 'package:quiver/core.dart';

@immutable
class ReportState {
  final List<Report> reports;

  final String error;
  final Set<int> downloadingReports;

  ReportState({
    this.reports = const [],
    this.downloadingReports = const {},
    this.error,
  });

  ReportState copyWith({
    List<Report> reports,
    Set<int> downloadingReports,
    Optional<String> error,
  }) {
    return new ReportState(
      reports: reports ?? this.reports,
      downloadingReports: downloadingReports ?? this.downloadingReports,
      error: reduceState(error, this.error),
    );
  }
}