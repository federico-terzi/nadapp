import 'package:nad_app/models/user.dart';

class PushNamed {
  final String route;
  final bool reset;

  PushNamed({this.route, this.reset = false});

  @override
  String toString() {
    return 'PushNamed{route: $route, reset: $reset}';
  }
}