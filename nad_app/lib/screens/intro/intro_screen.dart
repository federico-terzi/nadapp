import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_list.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadingList(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FadeInUp(
          child: BigButton(
            text: "Iniziamo",
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/patientCheck",
              );
            },
          ),
          preferences:
              AnimationPreferences(offset: Duration(milliseconds: 1000)),
        ),
      ),
    );
  }
}
