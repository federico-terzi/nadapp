import 'package:nad_app/models/user.dart';

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({this.username, this.password});

  @override
  String toString() {
    // TODO: remove sensitive data
    return 'LoginRequest{username: $username, password: $password}';
  }
}

class LoginPhaseOneSuccess {
  // TODO: this will contain the verification token
}

class LoginPhaseOneFailed {
  final Exception error;

  LoginPhaseOneFailed({this.error});
}

class VerifyRequest {
  final String code;

  VerifyRequest({this.code});

  @override
  String toString() {
    // TODO: remove sensitive data
    return 'VerifyRequest{code: $code}';
  }
}

class LoginPhaseTwoSuccess {
  final User user;

  LoginPhaseTwoSuccess({this.user});

  @override
  String toString() {
    return 'LoginPhaseTwoSuccess{user: $user}';
  }
}