import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nad_app/models/app_state.dart';
import 'package:nad_app/models/auth_state.dart';
import 'package:nad_app/models/meal_state.dart';
import 'package:nad_app/presentation/app_fab.dart';
import 'package:nad_app/presentation/app_scaffold.dart';
import 'package:nad_app/presentation/big_icon_button.dart';
import 'package:nad_app/presentation/telephone_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  void openWebsite() async {
    const url = "https://www.aosp.bo.it/content/ssd-centro-regionale-di-riferimento-linsufficienza-intestinale-cronica-benigna-pironi";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void openEmail(String email) async {
    String url = "mailto:$email";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  void openTelephone(String tel) async {
    String url = "tel:$tel";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  List<Widget> getPatientContent(bool loggedIn) {
    if (loggedIn) {
      return [
        SizedBox(height: 20),
        Text("Per le emergenze, è disponibile il numero:", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 15),

        TelephoneButton(
          number: "333 1231231", // TODO: change
          helpText: "dalle ore 8:00 alle 20:00",
          onPressed: () async {
            openTelephone("");  // TODO
          },
        ),

        SizedBox(height: 30),
        Text("Per le altre necessità, puoi contattare il numero:", textAlign: TextAlign.center),
        SizedBox(height: 15),
        TelephoneButton(
          number: "051 6363073",
          helpText: "dalle ore 8:30 alle 13:00 dal lunedì al venerdì",
          onPressed: () async {
            openTelephone("0516363073");
          },
        ),
        SizedBox(height: 30),

        Text("Oppure i seguenti indirizzi email:", textAlign: TextAlign.center),
        SizedBox(height: 10),
      ];
    } else {
      return [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text("Puoi contattare il Centro IICB Osp. Sant’Orsola Bologna ai seguenti indirizzi email:", textAlign: TextAlign.center),
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
        converter: (store) => store.state.auth,
        builder: (context, authState) {
          return AppScaffold(
            title: "Contatti",
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                      child: Image.asset(
                    "assets/centroiicb.png",
                    height: 140,
                  )),
                  ...getPatientContent(authState.sessionToken != null),
                  BigIconButton(
                      fontSize: 25,
                      text: "segiicb@aosp.bo.it",
                      onPressed: () async {
                        openEmail("segiicb@aosp.bo.it");
                      },
                      icon: Icons.email),
                  SizedBox(height: 10),
                  BigIconButton(
                      fontSize: 25,
                      text: "centroiicb@aosp.bo.it",
                      onPressed: () async {
                        openEmail("centroiicb@aosp.bo.it");
                      },
                      icon: Icons.email),
                  SizedBox(height: 30),
                  Text("Oppure", textAlign: TextAlign.center),
                  SizedBox(height: 15),
                  BigIconButton(
                      inverted: true,
                      text: "Visita sito web",
                      onPressed: () async {
                        openWebsite();
                      },
                      icon: Icons.open_in_new),
                  SizedBox(height: 15),
                ],
              ),
            ),
          );
        });
  }
}
