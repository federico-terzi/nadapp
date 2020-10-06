import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/date_button.dart';
import 'package:uuid/uuid.dart';

class AddMealForm extends StatefulWidget {
  final PersistenceState persistenceState;
  final DateTime initialDate = DateTime.now();
  final VoidCallback onScrollRequest;

  AddMealForm({Key key, this.persistenceState, this.onScrollRequest}) : super(key: key);

  @override
  _AddMealFormState createState() => _AddMealFormState();
}

class _AddMealFormState extends State<AddMealForm> {
  final _formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();
  String meal = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateButton(onPressed: () {
            DatePicker.showDateTimePicker(context,
                showTitleActions: true,
                minTime: Jiffy().subtract(days: 30),
                maxTime: DateTime.now(), onConfirm: (date) {
                  setState(() {
                    this.date = date;
                  });
                }, currentTime: date, locale: LocaleType.it);
          }, date: date),
          SizedBox(height: 20),
          Text(
            "Descrivi il tuo pasto:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          TextFormField(
            minLines: 5,
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              fillColor: Colors.white, filled: true,
                hintText: 'Inserisci qui il tuo pasto'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Per favore, inserisci il tuo pasto';
              }
              return null;
            },
            onChanged: (_) {
              widget.onScrollRequest();
            },
            onTap: () {
              widget.onScrollRequest();
            },
            onSaved: (String value) {
              meal = value;
            },
          ),
          SizedBox(height: 16),
          BigButton(
            text: "Aggiungi pasto",
            loading: this.widget.persistenceState.isSaving,
            onPressed: () {
              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                var uuid = Uuid();

                StoreProvider.of<AppState>(context).dispatch(AddMealRequest(
                  meal: Meal(
                    uuid: uuid.v4(),
                    date: date,
                    meal: meal.trim(),
                  )
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
