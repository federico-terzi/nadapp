import 'package:flutter/widgets.dart';

@immutable
class User {
  final String name;

  User({this.name});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
      };

  @override
  String toString() {
    return 'User{name: $name}';
  }
}