import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jiffy/jiffy.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/screens/balance/balance_card.dart';
import 'package:nad_app/theme/style.dart';
import 'package:nad_app/utils/date_utils.dart';

class BalanceScreen extends StatelessWidget {
  ListView _getRecentBalances(List<Balance> balances) {
    return ListView.builder(
        itemCount: balances.length,
        itemBuilder: (context, index) {
          int reverseIndex = balances.length - index - 1;

          Balance balance = balances[reverseIndex];

          // Make only the today balance clickable
          VoidCallback callback;
          var jiffy = Jiffy(balance.date);
          if (jiffy.isSame(DateTime.now(), Units.DAY)) {
            callback = () {
              Navigator.of(context)
                  .pushNamed(ADD_BALANCE_ROUTE, arguments: balance);
            };
          } else {
            callback = () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content:
                    Text("Non puoi modificare i bilanci dei giorni precedenti"),
              ));
            };
          }

          return BalanceCard(balance: balance, onPressed: callback);
        });
  }

  Future<bool> _showContinueDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
              alignment: Alignment.center,
              child: Text('Continua bilancio', style: TextStyle(fontSize: 26))),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Hai già inizito un bilancio oggi, vuoi completarlo?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                BigButton(
                  text: "No, iniziane uno nuovo",
                  fontSize: 20,
                  primary: false,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                SizedBox(height: 15),
                BigButton(
                  text: "Si, voglio completarlo",
                  fontSize: 20,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void gotoAddMeasurementScreen(
      BuildContext context, List<Balance> balances) async {
    // Check if there is already a Balance today
    Balance todayBalance;
    balances.forEach((balance) {
      var jiffy = Jiffy(balance.date);
      if (jiffy.isSame(DateTime.now(), Units.DAY)) {
        todayBalance = balance;
      }
    });

    bool shouldContinue = false;

    if (todayBalance != null) {
      bool userWantsToContinue = await _showContinueDialog(context);
      if (userWantsToContinue == null) {
        return;
      }

      if (userWantsToContinue) {
        shouldContinue = true;
      }
    }

    if (shouldContinue) {
      Navigator.of(context)
          .pushNamed(ADD_BALANCE_ROUTE, arguments: todayBalance);
    } else {
      Navigator.of(context).pushNamed(ADD_BALANCE_ROUTE);
    }
  }

  List<Widget> _getContent(BuildContext context, List<Balance> balances) {
    if (balances.length > 0) {
      return [
        Text(
          "Misurazioni più recenti:",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 10),
        Expanded(child: _getRecentBalances(balances)),
      ];
    } else {
      return [
        Text(
          "Non hai ancora registrato alcuna misurazione, utilizza il pulsante in basso per iniziare.",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BalanceState>(
        converter: (store) => store.state.balance,
        builder: (context, balanceState) {
          return AppScaffold(
            title: "Bilancio idrico",
            body: Column(
              children: [..._getContent(context, balanceState.balances)],
            ),
            fab: AppFab(
                text: true ? "Aggiungi misurazione" : "Continua misurazione",
                // TODO
                onPressed: () {
                  gotoAddMeasurementScreen(context, balanceState.balances);
                },
                icon: true ? Icons.add : Icons.restore), // TODO
          );
        });
  }
}
