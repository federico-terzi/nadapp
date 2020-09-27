import 'package:flutter/material.dart';

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
