import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/balance.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_info_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/screens/add_balance/add_balance_form.dart';

class AddBalanceScreen extends StatelessWidget {
  final Balance initialBalance;

  AddBalanceScreen(this.initialBalance);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, appState) {
          return AppScaffold(
              title: initialBalance == null
                  ? "Aggiungi bilancio"
                  : "Continua bilancio",
              action: IconButton(
                icon: Icon(Icons.help_outline, size: 36),
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(ADD_BALANCE_TIPS_ROUTE);
                },
              ),
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AddBalanceForm(
                            persistenceState: appState.persistence,
                            balanceState: appState.balance,
                            initialBalance: initialBalance),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
