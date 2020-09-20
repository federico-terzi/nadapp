import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/date_button.dart';
import 'package:nad_app/theme/style.dart';

class AddBalanceForm extends StatefulWidget {
  final PersistenceState persistenceState;
  final BalanceState balanceState;
  final DateTime initialDate = DateTime.now();

  AddBalanceForm({Key key, this.persistenceState, this.balanceState})
      : super(key: key);

  @override
  _AddBalanceFormState createState() => _AddBalanceFormState();
}

class _AddBalanceFormState extends State<AddBalanceForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();
  Balance balance = Balance();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Data:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          DateButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: Jiffy().subtract(days: 30),
                  maxTime: DateTime.now(), onConfirm: (date) {
                setState(() {
                  this.date = date;

                  // TODO: update balance
                });
              }, currentTime: date, locale: LocaleType.it);
            },
            date: date,
            includeTime: false,
          ),
          SizedBox(height: 20),
          Text(
            "Pressione arteriosa:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Massima'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Massima mancante';
                    }
                    return null;
                  },
                  onTap: () {
                    Scrollable.ensureVisible(context);
                  },
                  onSaved: (String value) {
                    //meal = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Flexible(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Minima'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Minima mancante';
                    }
                    return null;
                  },
                  onTap: () {
                    Scrollable.ensureVisible(context);
                  },
                  onSaved: (String value) {
                    //meal = value;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Frequenza cardiaca:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "BPM",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci la tua frequenza cardiaca';
              }
              return null;
            },
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Peso corporeo:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Kg",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il tuo peso corporeo';
              }
              return null;
            },
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Diuresi:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il volume di diuresi';
              }
              return null;
            },
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Alvo: numero di evacuazioni",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "N/24h",
            ),
            validator: (value) {
              // TODO check if number
              return null;
            },
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Consistenza evacuazioni",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: DARKEST_GRAY_COLOR),
                borderRadius: BorderRadius.circular(15)),
            child: DropdownButtonFormField<String>(
              value: balance.fecesTexture,
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              decoration: InputDecoration.collapsed(
                  hintText: 'Seleziona la consistenza, se applicabile'),
              style: Theme.of(context).textTheme.bodyText1,
              onChanged: (String newValue) {
                setState(() {
                  balance = this.balance.copyWith(fecesTexture: newValue);
                });
              },
              items: <String>[
                "Acquosa",
                "Liquida",
                "Semi Liquida",
                "Semi Formata",
                "Formata"
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Volume della STOMIA:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume PEG (o altro drenaggio intestinale):",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Altre perdite gastrointestinali:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Specificare quali e quante",
            ),
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume nutrizione parenterale",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume altri liquidi endovena:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            minLines: 3,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "Specificare quali e quante",
            ),
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Liquidi per OS (bevande):",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il volume liquidi per OS';
              }
              return null;
            },
            onTap: () {
              //Scrollable.ensureVisible(context);
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume liquidi endovena:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: "ML/24h",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il volume liquidi endovena';
              }
              return null;
            },
            onSaved: (String value) {
              //meal = value;
            },
          ),
          SizedBox(height: 30),
          Text(
              "Ricorda che puoi anche compilare il questionario solo in parte e poi completarlo in un secondo momento, senza perdere i dati inseriti.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
          SizedBox(height: 30),
          BigButton(
            text: "Concludi bilancio",
            loading: this.widget.persistenceState.isSaving,
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                /*
                StoreProvider.of<AppState>(context).dispatch(AddMealRequest(
                  meal: Meal(
                    date: date,
                    meal: meal.trim(),
                  )
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
