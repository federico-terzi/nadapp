import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_list.dart';

class PatientCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadingList(
        children: [
          Text("Sei un paziente?", style: Theme.of(context).textTheme.headline1, textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0),
            child: Image.asset("assets/centroiicb.png"),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FadeInUp(
          child: Column(
            children: [
              BigButton(
                text: "Si, sono un paziente in cura presso il Centro IICB Osp. Sant’Orsola Bologna",
                fontSize: 20,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/patientCheck",
                  );
                },
              ),
              Padding(padding: EdgeInsets.all(10)),
              BigButton(
                text: "No, vorrei solo informazioni",
                fontSize: 20,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    "/patientCheck",
                  );
                },
              ),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
          preferences:
              AnimationPreferences(offset: Duration(milliseconds: 1000)),
        ),
      ),
    );
  }
}
