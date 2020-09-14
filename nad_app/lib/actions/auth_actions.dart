class LoginRequest {
  final String username;
  final String password;

  LoginRequest({this.username, this.password});

  @override
  String toString() {
    // TODO: remove
    return 'LoginRequest{username: $username, password: $password}';
  }
}

class LoginPhaseOneSuccess {

}

class LoginPhaseOneFailed {
  final Exception error;

  LoginPhaseOneFailed({this.error});
}