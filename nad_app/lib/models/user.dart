class User {
  final String username;
  final String name;

  User({this.username, this.name});

  @override
  String toString() {
    return 'User{username: $username, name: $name}';
  }
}