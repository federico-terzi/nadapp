import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: Colors.white,
      accentColor: Color.fromRGBO(9, 132, 227, 1),
      hintColor: Colors.white,
      dividerColor: Colors.white,
      buttonColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      canvasColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 40,
            color: Color.fromRGBO(9, 132, 227, 1),
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 48,
            color: Color.fromRGBO(9, 132, 227, 1),
            fontWeight: FontWeight.bold),
        bodyText1: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.normal),
      ));
}
