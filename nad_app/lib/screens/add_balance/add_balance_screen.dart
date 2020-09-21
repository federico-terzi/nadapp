import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_info_button.dart';
import 'package:nad_app/screens/add_balance/add_balance_form.dart';

class AddBalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, appState) {
          return AppScaffold(
              title: appState.balance.currentBalance == null ? "Aggiungi bilancio" : "Continua bilancio",
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigInfoButton(
                          text:
                              "Se non ricordi come compilare il bilancio idrico, clicca qui!",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20),
                        AddBalanceForm(persistenceState: appState.persistence, balanceState: appState.balance),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
