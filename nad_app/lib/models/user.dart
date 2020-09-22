import 'package:flutter/widgets.dart';

@immutable
class User {
  final String username;
  final String name;

  User({this.username, this.name});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        username = json['username'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'username': username,
      };

  @override
  String toString() {
    return 'User{username: $username, name: $name}';
  }
}