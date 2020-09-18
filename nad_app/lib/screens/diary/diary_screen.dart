import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/utils/date_utils.dart';

class DiaryScreen extends StatelessWidget {
  ListView _getRecentMeals(List<Meal> meals) {
    return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: ListTile(
                title: Text(getFormattedDate(meals[index].date), style: Theme.of(context).textTheme.headline4),
                subtitle:
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(meals[index].meal, style: Theme.of(context).textTheme.bodyText2),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MealState>(
        converter: (store) => store.state.meal,
        builder: (context, mealState) {
          return AppScaffold(
            title: "Diario alimentare",
            body: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                children: [
                  BigIconButton(
                      text: "Aggiungi pasto",
                      onPressed: () {},
                      icon: Icons.add_circle_outline),
                  SizedBox(height: 20),
                  Text(
                    "Pasti recenti:",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 10),
                  Expanded(child: _getRecentMeals(mealState.meals)),
                ],
              ),
            ),
            fab: AppFab(
              tooltip: "Aggiungi pasto",
              onPressed: () => {},
            ),
          );
        });
  }
}
