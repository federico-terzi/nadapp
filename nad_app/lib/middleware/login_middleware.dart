import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/navigation_actions.dart';
import 'package:nad_app/actions/sync_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/user.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/server_config.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

void loginMiddleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoginRequest) {
    http
        .post(LOGIN_ENDPOINT,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "username": "patient@${action.username}",
              "password": action.password,
            }))
        .then((res) {
      Map<String, dynamic> resBody = jsonDecode(res.body);
      print("status: ${res.statusCode}, body: $resBody");
      if (res.statusCode == 200) {
        if (resBody.containsKey("verify")) {
          String verificationToken = resBody["verify"];
          store.dispatch(
              LoginPhaseOneSuccess(verificationToken: verificationToken));
        } else {
          store.dispatch(
              LoginPhaseOneFailed(message: "Errore lato server"));
        }
      } else {
        String error = resBody["error"];
        String errorMessage = "Errore sconosciuto";
        if (error == "user not found") {
          errorMessage = "Utente non presente nel sistema";
        } else if (error == "invalid credentials") {
          errorMessage = "Credenziali non valide, riprova";
        }
        store.dispatch(
            LoginPhaseOneFailed(message: errorMessage));
      }
    }).catchError((error) {
      print(error);
      String message = "Errore sconosciuto";
      if (error is SocketException) {
        message = "Errore di connessione";
      }
      store.dispatch(
          LoginPhaseOneFailed(message: message, error: error));
    });
  } else if (action is VerifyRequest) {
    http
        .post(LOGIN_VERIFICATION_ENDPOINT,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "code": action.code,
          "token": store.state.auth.verificationToken,
        }))
        .then((res) {
      Map<String, dynamic> resBody = jsonDecode(res.body);
      print("status: ${res.statusCode}, body: $resBody");
      if (res.statusCode == 200) {
        String cookieHeader = res.headers["set-cookie"];
        String sessionToken = cookieHeader.split(";")[0];
        store.dispatch(
            LoginPhaseTwoSuccess(token: sessionToken));
        store.dispatch(PushNamed(route: HOME_ROUTE, reset: true));
        store.dispatch(RequestSync());
      } else {
        String error = resBody["error"];
        String errorMessage = "Errore sconosciuto";
        if (error == "invalid token") {
          errorMessage = "Il codice di verifica è scaduto";
        } else if (error == "invalid code") {
          errorMessage = "Codice non valido";
        }
        store.dispatch(
            LoginPhaseTwoFailed(message: errorMessage));
      }
    }).catchError((error) {
      print(error);
      String message = "Errore sconosciuto";
      if (error is SocketException) {
        message = "Errore di connessione";
      }
      store.dispatch(
          LoginPhaseTwoFailed(message: message, error: error));
    });
  } else if (action is ConvertTokenRequest) {
    http
        .post(SPID_CONVERT_TOKEN_ENDPOINT,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          "token": action.token,
        }))
        .then((res) {
      Map<String, dynamic> resBody = jsonDecode(res.body);
      print("status: ${res.statusCode}, body: $resBody");
      if (res.statusCode == 200) {
        String cookieHeader = res.headers["set-cookie"];
        String sessionToken = cookieHeader.split(";")[0];
        store.dispatch(
            LoginPhaseTwoSuccess(token: sessionToken));
        store.dispatch(PushNamed(route: HOME_ROUTE, reset: true));
        store.dispatch(RequestSync());
      } else {
        String error = resBody["error"];
        String errorMessage = "Errore sconosciuto";
        if (error == "invalid token") {
          errorMessage = "Il codice di verifica è scaduto";
        }
        store.dispatch(
            LoginPhaseTwoFailed(message: errorMessage));
      }
    }).catchError((error) {
      print(error);
      String message = "Errore sconosciuto";
      if (error is SocketException) {
        message = "Errore di connessione";
      }
      store.dispatch(
          LoginPhaseTwoFailed(message: message, error: error));
    });
  } else if (action is LogoutStatusUpdated) {
    if (store.state.auth.logoutPreferenceCleared && store.state.auth.logoutDBCleared) {
      store.dispatch(LogoutSuccess());
    }
  }

  next(action);
}
