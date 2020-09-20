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

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BalanceState>(
        converter: (store) => store.state.balance,
        builder: (context, balanceState) {
          return AppScaffold(
            title: "Bilancio idrico",
            body: Column(
              children: [
                BigIconButton(
                    text: "Aggiungi misurazione",
                    onPressed: () {
                      gotoAddMeasurementScreen(context);
                    },
                    icon: Icons.add_circle_outline),
                SizedBox(height: 20),
                Text(
                  "Misurazioni recenti:",
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 10),
                Expanded(child: _getRecentBalances(balanceState.balances)),
              ],
            ),
            fab: AppFab(
              tooltip: "Aggiungi misurazione",
              onPressed: () {
                gotoAddMeasurementScreen(context);
              },
            ),
          );
        });
  }
}
