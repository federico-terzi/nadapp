import 'package:flutter/material.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/routes.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadingScaffold(
      children: [
        Flexible(
          flex: 1,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/logo.png", height: 150)),
        ),
        Flexible(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Benvenuto!", style: Theme.of(context).textTheme.headline1),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                    "Prima di cominciare ho bisogno di farti un paio di domande per poterti aiutare al meglio.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
            ],
          ),
        ),
        BigButton(
          text: "Iniziamo",
          onPressed: () {
            Navigator.pushNamed(
              context,
              PATIENT_CHECK_ROUTE,
            );
          },
        ),
      ],
    );
  }
}
