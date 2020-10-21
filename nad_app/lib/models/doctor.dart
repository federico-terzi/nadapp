import 'package:flutter/widgets.dart';

@immutable
class Doctor {
  final String uuid;
  final String name;

  Doctor({this.uuid, this.name});

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'name': name,
    };
  }

  Doctor.fromMap(Map<String, dynamic> map)
      : uuid = map['uuid'],
        name = map['name'];

  Map<String, dynamic> toJson() => this.toMap();

  @override
  String toString() {
    return 'Doctor{uuid: $uuid, name: $name}';
  }
}