import 'package:flutter/material.dart';

@immutable
class OpenReportRequest {
  final int id;

  OpenReportRequest({@required this.id});

  @override
  String toString() {
    return 'OpenReportRequest{id: $id}';
  }
}

@immutable
class OpenReportDownloaded {
  final int id;

  OpenReportDownloaded({@required this.id});

  @override
  String toString() {
    return 'OpenReportDownloaded{id: $id}';
  }
}

class OpenReportError {
  final int id;
  final String error;

  OpenReportError({this.id, this.error});

  @override
  String toString() {
    return 'OpenReportError{id: $id, error: $error}';
  }
}