import 'package:flutter/widgets.dart';

@immutable
class Doctor {
  final String uuid;
  final String name;
  final String summary;

  Doctor({this.uuid, this.name, this.summary});

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
      'summary': summary,
    };
  }

  Doctor.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'],
        name = map['name'],
        summary = map['summary'];

  Map<String, dynamic> toJson() => this.toMap();

  @override
  String toString() {
    return 'Doctor{uuid: $uuid, name: $name, summary: $summary}';
  }
}