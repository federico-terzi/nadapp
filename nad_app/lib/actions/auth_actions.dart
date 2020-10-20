
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
  final String verificationToken;

  LoginPhaseOneSuccess({this.verificationToken});

  @override
  String toString() {
    return 'LoginPhaseOneSuccess{verificationToken: $verificationToken}';
  }
}

class LoginPhaseOneFailed {
  final String message;
  final Exception error;

  LoginPhaseOneFailed({this.message, this.error});
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
  final String token;

  LoginPhaseTwoSuccess({this.token});

  @override
  String toString() {
    return 'LoginPhaseTwoSuccess{token: $token}';
  }
}

class LoginPhaseTwoFailed {
  final String message;
  final Exception error;

  LoginPhaseTwoFailed({this.message, this.error});
}