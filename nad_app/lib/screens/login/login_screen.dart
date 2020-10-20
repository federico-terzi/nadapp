import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/screens/login/login_phase_one_form.dart';

import 'login_phase_two_form.dart';

class LoginScreen extends StatelessWidget {
  Widget _getLoginForm(AuthState authState) {
    if (!authState.isPhaseOneCompleted) {
      return LoginPhaseOneForm(authState: authState);
    } else {
      return LoginPhaseTwoForm(authState: authState);
    }
  }

  Widget _getHelpButton(AuthState authState) {
    if (!authState.isPhaseOneCompleted) {
      return BigButton(
          text: "Vuoi registrarti o hai dimenticato le tue credenziali?",
          fontSize: 20,
          primary: false,
          onPressed: () {
            // TODO
          });
    } else {
      return BigButton(
          text: "Non hai ricevuto il codice?",
          fontSize: 20,
          primary: false,
          onPressed: () {
            // TODO
          });
    }
  }

  Future<void> _showErrorDialog(BuildContext context, String message) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Errore'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message)
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Riprova"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      converter: (store) => store.state.auth,
      builder: (context, authState) {
        return FadingScaffold(
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/logo.png", height: 100),
                  ),
                  Text("Accedi", style: Theme.of(context).textTheme.headline1),
                ],
              ),
            ),
            Flexible(flex: 4, child: Center(child: _getLoginForm(authState))),
            _getHelpButton(authState),
          ],
        );
      },
      onDidChange: (authState) {
        if (authState.error != null) {
          _showErrorDialog(context, authState.error);
        }
      },
    );
  }
}
