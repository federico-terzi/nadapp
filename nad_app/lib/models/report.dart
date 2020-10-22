import 'package:flutter/widgets.dart';

@immutable
class Report {
  final int id;
  final DateTime date;

  Report({this.id, this.date});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date.toIso8601String(),
    };
  }

  Report.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        date = DateTime.parse(map['date']);

  Map<String, dynamic> toJson() => this.toMap();

  @override
  String toString() {
    return 'Report{id: $id, date: $date}';
  }
}