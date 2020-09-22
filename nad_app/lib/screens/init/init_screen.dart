import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:nad_app/presentation/big_button.dart';
import 'package:nad_app/presentation/fading_scaffold.dart';
import 'package:nad_app/routes.dart';

class InitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 70,
            width: 70,
            child: CircularProgressIndicator(value: null, strokeWidth: 6,)),
      ),
    );
  }
}
