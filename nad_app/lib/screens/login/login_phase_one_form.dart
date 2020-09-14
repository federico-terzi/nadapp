import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';

class LoginPhaseOneForm extends StatefulWidget {
  final AuthState authState;

  const LoginPhaseOneForm({Key key, this.authState}) : super(key: key);

  @override
  _LoginPhaseOneFormState createState() => _LoginPhaseOneFormState();
}

class _LoginPhaseOneFormState extends State<LoginPhaseOneForm> {
  final _formKey = GlobalKey<FormState>();

  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 30),
            child: Text(
                "Inserisci le tue credenziali NAD-APP per accedere al sistema",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2),
          ),
          TextFormField(
            decoration: InputDecoration(
                labelText: "Utente", hintText: 'Inserisci il tuo utente'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il tuo utente';
              }
              return null;
            },
            onSaved: (String value) {
              username = value;
            },
            onTap: () {
              Scrollable.ensureVisible(context);
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password", hintText: 'Inserisci la tua password'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci la tua password';
              }
              return null;
            },
            onSaved: (String value) {
              password = value;
            },
            onTap: () {
              Scrollable.ensureVisible(context);
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          BigButton(
            text: "Entra",
            loading: this.widget.authState.isLoading,
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                StoreProvider.of<AppState>(context).dispatch(LoginRequest(
                  username: username,
                  password: password,
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
