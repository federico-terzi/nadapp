import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/screens/login/login_phase_one_form.dart';
import 'package:quiver/core.dart';

import '../../routes.dart';
import 'login_phase_two_form.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isIICBLoginStarted = false;

  Widget _getStrategySelectionPanel(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text("Seleziona il metodo d'accesso:", style: Theme.of(context).textTheme.bodyText2,),
        SizedBox(height: 30,),
        BigButton(
            text: "Accedi con Credenziali IICB",
            fontSize: 20,
            primary: true,
            onPressed: () {
              this.setState(() {
                isIICBLoginStarted = true;
              });
            }),
        SizedBox(height: 20,),
        BigButton(
            text: "Accedi con SPID",
            fontSize: 20,
            primary: false,
            onPressed: () {
              Navigator.pushNamed(context, SPID_WEBVIEW_ROUTE);
            }),
      ],
    );
  }

  Widget _getContent(AuthState authState) {
    if (!isIICBLoginStarted) {
      return _getStrategySelectionPanel(context);
    } else {
      if (!authState.isPhaseOneCompleted) {
        return LoginPhaseOneForm(authState: authState);
      } else {
        return LoginPhaseTwoForm(authState: authState);
      }
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
                  Text("Accedi", style: Theme
                      .of(context)
                      .textTheme
                      .headline1),
                ],
              ),
            ),
            Flexible(flex: 4, child: Center(child: _getContent(authState))),
            _getHelpButton(authState),
          ],
        );
      },
      onWillChange: (previousAuthState, authState) {
        if (previousAuthState.error == null && authState.error != null) {
          _showErrorDialog(context, authState.error);
        }
      },
    );
  }
}
