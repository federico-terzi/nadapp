import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/doctor.dart';
import 'package:nad_app/models/doctor_state.dart';
import 'package:nad_app/models/meal.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/routes.dart';
import 'package:nad_app/utils/date_utils.dart';

class MyDoctorsScreen extends StatelessWidget {
  List<Widget> getDoctors(BuildContext context, List<Doctor> doctors) {
    return doctors
        .map((doctor) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: ListTile(
                    title: Text(doctor.name,
                        style: Theme.of(context).textTheme.headline3),
                    ),
                  ),
                ),
              ),
            )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, DoctorState>(
        converter: (store) => store.state.doctor,
        builder: (context, doctorState) {
          return AppScaffold(
            title: "I miei medici",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ...getDoctors(context, doctorState.doctors),
                  Text(
                    "Per aggiungere o rimuovere un medico autorizzato, contatta il Centro IICB Osp. Sant’Orsola Bologna",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  BigButton(
                    text: "Contatta Centro IICB",
                    onPressed: () {
                      Navigator.of(context).pushNamed(CONTACT_ROUTE);
                    },
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
