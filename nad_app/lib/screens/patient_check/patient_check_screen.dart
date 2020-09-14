import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_column.dart';

class PatientCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadingColumn(
      children: [
        Flexible(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text("Sei un paziente?",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center)
          ),
        ),
        Flexible(flex: 3, child: Center(child: Image.asset("assets/centroiicb.png"))),
        BigButton(
          text:
              "Si, sono un paziente in cura presso il Centro IICB Osp. Sant’Orsola Bologna",
          fontSize: 20,
          onPressed: () {
            Navigator.pushNamed(
              context,
              "/login",
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: BigButton(
            text: "No, vorrei solo informazioni",
            fontSize: 20,
            primary: false,
            onPressed: () {
              // TODO
            },
          ),
        ),
      ],
    );
  }
}
