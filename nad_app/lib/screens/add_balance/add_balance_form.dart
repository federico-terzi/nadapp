import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/actions/auth_actions.dart';
import 'package:nad_app/actions/balance_actions.dart';
import 'package:nad_app/actions/meal_actions.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/persistence_state.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/date_button.dart';
import 'package:nad_app/presentation/focus_text_form_field.dart';
import 'package:nad_app/theme/style.dart';
import 'package:uuid/uuid.dart';

class AddBalanceForm extends StatefulWidget {
  final PersistenceState persistenceState;
  final BalanceState balanceState;
  final DateTime initialDate = DateTime.now();
  final Balance initialBalance;

  AddBalanceForm(
      {Key key, this.persistenceState, this.balanceState, this.initialBalance})
      : super(key: key);

  @override
  _AddBalanceFormState createState() => _AddBalanceFormState();
}

class _AddBalanceFormState extends State<AddBalanceForm> {
  final _formKey = GlobalKey<FormState>();

  Balance balance;
  bool alreadyTriedSubmitting = false;
  bool alreadySubmitted = false;

  @override
  void initState() {
    if (widget.initialBalance != null) {
      balance = widget.initialBalance;
    } else {
      var uuid = Uuid();
      balance = Balance(uuid: uuid.v4(), date: DateTime.now());
    }

    super.initState();
  }

  void updateBalance(Balance balance) {
    this.setState(() {
      this.balance = balance;
    });

    if (!alreadySubmitted) {
      StoreProvider.of<AppState>(context).dispatch(SaveBalanceRequest(
        balance: balance,
      ));
    }
  }

  Future<void> _showNotCompletedDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bilancio incompleto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Il bilancio non è ancora completo, mancano alcuni campi (evidenziati in rosso). Devi completarli per poterlo inviare.'),
                Text(
                  'Ricorda che puoi completare il bilancio anche in un secondo momento, senza perdere i dati finora inseriti.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Cosa vuoi fare?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Riprendi più tardi'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text(
                'Finisci di completare',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
    return Form(
      autovalidate: alreadyTriedSubmitting,
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateButton(
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: Jiffy().subtract(days: 30),
                  maxTime: DateTime.now(), onConfirm: (date) {
                updateBalance(balance.copyWith(date: date));
              }, currentTime: balance.date, locale: LocaleType.it);
            },
            date: balance.date,
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
                  child: FocusTextFormField(
                initialValue: balance.maxPressure != null
                    ? balance.maxPressure.toString()
                    : "",
                keyboardType: TextInputType.number,
                labelText: 'Massima',
                validator: (value) {
                  if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                    return "Numero non valido";
                  }
                  return null;
                },
                onEditingEnded: (String value) {
                  if (value.trim().isNotEmpty) {
                    updateBalance(
                        balance.copyWith(maxPressure: int.parse(value)));
                  }
                },
                onSaved: (String value) {
                  if (value.trim().isNotEmpty) {
                    this.balance =
                        this.balance.copyWith(maxPressure: int.parse(value));
                  }
                },
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "-",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              Flexible(
                  child: FocusTextFormField(
                initialValue: balance.minPressure != null
                    ? balance.minPressure.toString()
                    : "",
                keyboardType: TextInputType.number,
                labelText: 'Minima',
                validator: (value) {
                  if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                    return "Numero non valido";
                  }
                  return null;
                },
                onEditingEnded: (String value) {
                  if (value.trim().isNotEmpty) {
                    updateBalance(
                        balance.copyWith(minPressure: int.parse(value)));
                  }
                },
                onSaved: (String value) {
                  if (value.trim().isNotEmpty) {
                    this.balance =
                        this.balance.copyWith(minPressure: int.parse(value));
                  }
                },
              )),
            ],
          ),
          SizedBox(height: 20),
          Text(
            "Frequenza cardiaca:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue: balance.heartFrequency != null
                ? balance.heartFrequency.toString()
                : "",
            keyboardType: TextInputType.number,
            labelText: 'BPM',
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(
                    balance.copyWith(heartFrequency: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance =
                    balance.copyWith(heartFrequency: int.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Peso corporeo:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue:
                balance.weight != null ? balance.weight.toString() : "",
            keyboardType: TextInputType.number,
            labelText: 'Kg',
            validator: (value) {
              value = value.replaceAll(",", ".");
              if (value.trim().isNotEmpty && double.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                value = value.replaceAll(",", ".");
                updateBalance(balance.copyWith(weight: double.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                value = value.replaceAll(",", ".");
                this.balance = balance.copyWith(weight: double.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Diuresi:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue:
                balance.diuresis != null ? balance.diuresis.toString() : "",
            keyboardType: TextInputType.number,
            labelText: "ML/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(diuresis: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(diuresis: int.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Alvo: numero di evacuazioni",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue:
                balance.fecesCount != null ? balance.fecesCount.toString() : "",
            keyboardType: TextInputType.number,
            labelText: "N/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(fecesCount: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(fecesCount: int.parse(value));
              }
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
                updateBalance(balance.copyWith(fecesTexture: newValue));
                FocusScope.of(context).requestFocus(new FocusNode());
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
              onSaved: (String value) {
                if (value != null) {
                  this.balance = balance.copyWith(fecesTexture: value);
                }
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Volume della STOMIA:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue: balance.ostomyVolume != null
                ? balance.ostomyVolume.toString()
                : "",
            keyboardType: TextInputType.number,
            labelText: "ML/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(ostomyVolume: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(ostomyVolume: int.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume PEG (o altro drenaggio intestinale):",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue:
                balance.pegVolume != null ? balance.pegVolume.toString() : "",
            keyboardType: TextInputType.number,
            labelText: "ML/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(pegVolume: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(pegVolume: int.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Altre perdite gastrointestinali:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue: balance.otherGastrointestinalLosses,
            minLines: 3,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            labelText: "Specificare quali e quante",
            validator: (value) {
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(
                    balance.copyWith(otherGastrointestinalLosses: value));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance =
                    balance.copyWith(otherGastrointestinalLosses: value);
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume nutrizione parenterale",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue: balance.parenteralNutritionVolume != null
                ? balance.parenteralNutritionVolume.toString()
                : "",
            keyboardType: TextInputType.number,
            labelText: "ML/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(
                    parenteralNutritionVolume: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(
                    parenteralNutritionVolume: int.parse(value));
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Volume altri liquidi endovena:",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue: balance.otherIntravenousLiquids,
            minLines: 3,
            maxLines: 3,
            keyboardType: TextInputType.multiline,
            labelText: "Specificare quali e quante",
            validator: (value) {
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(otherIntravenousLiquids: value));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(otherIntravenousLiquids: value);
              }
            },
          ),
          SizedBox(height: 20),
          Text(
            "Liquidi per OS (bevande):",
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 10),
          FocusTextFormField(
            initialValue:
                balance.osLiquids != null ? balance.osLiquids.toString() : "",
            keyboardType: TextInputType.number,
            labelText: "ML/24h",
            validator: (value) {
              if (value.trim().isNotEmpty && int.tryParse(value) == null) {
                return "Numero non valido";
              }
              return null;
            },
            onEditingEnded: (String value) {
              if (value.trim().isNotEmpty) {
                updateBalance(balance.copyWith(osLiquids: int.parse(value)));
              }
            },
            onSaved: (String value) {
              if (value.trim().isNotEmpty) {
                this.balance = balance.copyWith(osLiquids: int.parse(value));
              }
            },
          ),
          SizedBox(height: 30),
          Text(
              "Ricorda che puoi anche compilare il questionario solo in parte e poi completarlo in un secondo momento, senza perdere i dati inseriti.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2),
          SizedBox(height: 30),
          BigButton(
            text: "Salva bilancio",
            loading: this.widget.persistenceState.isSaving,
            onPressed: () {
              setState(() {
                alreadyTriedSubmitting = true;
              });

              // Validate returns true if the form is valid, otherwise false.
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();

                setState(() {
                  alreadySubmitted = true;
                });

                StoreProvider.of<AppState>(context).dispatch(SaveBalanceRequest(
                  balance: balance,
                  isSubmit: true,
                ));
              } else {
                _showNotCompletedDialog();
              }
            },
          ),
        ],
      ),
    );
  }
}
