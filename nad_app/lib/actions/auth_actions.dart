
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({this.username, this.password});

  @override
  String toString() {
    return 'LoginRequest{username: $username}';
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


class ConvertTokenRequest {
  final String token;

  ConvertTokenRequest({this.token});

  @override
  String toString() {
    return 'ConvertTokenRequest{token: $token}';
  }
}

class LogoutRequest {
  final bool requestedByUser;

  LogoutRequest({this.requestedByUser});
}
class LogoutSuccess {}

class LogoutStatusUpdated {}
class LogoutDBCleared {}
class LogoutPreferencesCleared {}