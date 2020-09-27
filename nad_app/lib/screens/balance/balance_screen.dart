import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/models/balance_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/screens/balance/balance_card.dart';
import 'package:nad_app/utils/date_utils.dart';

class BalanceScreen extends StatelessWidget {
  ListView _getRecentBalances(List<Balance> balances) {
    return ListView.builder(
        itemCount: balances.length,
        itemBuilder: (context, index) {
          int reverseIndex = balances.length - index - 1;
          return BalanceCard(balance: balances[reverseIndex]);
        });
  }
  
  void gotoAddMeasurementScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ADD_BALANCE_ROUTE);
  }

  List<Widget> _getContent(BuildContext context, List<Balance> balances) {
    if (balances.length > 0) {
      return [
        Text(
          "Misurazioni più recenti:",
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .headline4,
        ),
        SizedBox(height: 10),
        Expanded(child: _getRecentBalances(balances)),
      ];
    } else {
      return [
        Text(
          "Non hai ancora registrato alcuna misurazione, utilizza il pulsante in basso per iniziare.",
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .textTheme
              .bodyText1,
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
              children: [
                ..._getContent(context, balanceState.balances)
              ],
            ),
            fab: AppFab(
                text: balanceState.currentBalance == null ? "Aggiungi misurazione" : "Continua misurazione",
                onPressed: () {
                  gotoAddMeasurementScreen(context);
                },
                icon: balanceState.currentBalance == null ? Icons.add : Icons.restore),
          );
        });
  }
}
