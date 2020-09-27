import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/utils/date_utils.dart';

class UsefulInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MealState>(
        converter: (store) => store.state.meal,
        builder: (context, mealState) {
          return AppScaffold(
            title: "Informazioni utili",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "assets/informati.png",
                    height: 140,
                  )),
                  Text("In questa sezione puoi trovare una serie di informazioni utili sulle patologie connesse all’insufficienza intestinale e sulla NAD. Per cominciare, seleziona un argomento:",
                      style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,),
                  SizedBox(height: 30),
                  BigIconButton(
                      inverted: true,
                      text: "Insufficienza intestinale cronica benigna (IICB)",
                      onPressed: () {
                        Navigator.of(context).pushNamed(USEFUL_INFORMATION_IICB_ROUTE);
                      },
                      icon: Icons.help),
                  SizedBox(height: 20),
                  BigIconButton(
                      inverted: true,
                      text: "Terapia e prognosi della IICB",
                      onPressed: () {
                        Navigator.of(context).pushNamed(USEFUL_INFORMATION_IICB_THERAPY_ROUTE);
                      },
                      icon: Icons.healing),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
