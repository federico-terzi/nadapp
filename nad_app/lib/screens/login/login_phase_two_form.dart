import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/presentation/big_button.dart';

class LoginPhaseTwoForm extends StatefulWidget {
  final AuthState authState;

  const LoginPhaseTwoForm({Key key, this.authState}) : super(key: key);

  @override
  _LoginPhaseTwoFormState createState() => _LoginPhaseTwoFormState();
}

class _LoginPhaseTwoFormState extends State<LoginPhaseTwoForm> {
  final _formKey = GlobalKey<FormState>();

  String verificationCode;

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
                "È stato inviato un codice di verifica al numero di telefono associato al tuo account, inseriscilo per completare l’accesso.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Codice verifica SMS", hintText: 'Inserisci il codice di verifica'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il codice ricevuto via SMS';
              }
              return null;
            },
            onSaved: (String value) {
              verificationCode = value;
            },
            onTap: () {
              Scrollable.ensureVisible(context);
            },
          ),
          Padding(padding: EdgeInsets.all(8)),
          BigButton(
            text: "Verifica",
            loading: this.widget.authState.isLoading,
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                /*
                StoreProvider.of<AppState>(context).dispatch(LoginRequest(
                  username: username,
                  password: password,
                ));
                */
              }
            },
          ),
        ],
      ),
    );
  }
}
