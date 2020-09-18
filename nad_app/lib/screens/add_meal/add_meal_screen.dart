import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/presentation/big_info_button.dart';
import 'package:nad_app/screens/add_meal/add_meal_form.dart';

class AddMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, appState) {
          return AppScaffold(
              title: "Aggiungi pasto",
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigInfoButton(
                          text:
                              "Se non ricordi come compilare il diario alimentare, clicca qui!",
                          onPressed: () {},
                        ),
                        SizedBox(height: 20),
                        AddMealForm(persistenceState: appState.persistence),
                      ],
                    ),
                  ),
                ],
              ));
        });
  }
}
