import 'package:flutter/material.dart';

const MAIN_COLOR = Color.fromRGBO(9, 132, 227, 1);
const DARKER_COLOR = Color.fromRGBO(0, 48, 85, 1);
const ALMOST_BLACK_COLOR = Color.fromRGBO(45, 52, 54, 1);
const LIGHT_GRAY_COLOR = Color.fromRGBO(245, 245, 245, 1);
const DARKER_GRAY_COLOR = Color.fromRGBO(178, 190, 195, 1);
const DARKEST_GRAY_COLOR = Color.fromRGBO(99, 110, 114, 1);

ThemeData appTheme() {
  return ThemeData(
      primaryColor: MAIN_COLOR,
      accentColor: MAIN_COLOR,
      hintColor: Color.fromRGBO(99, 110, 114, 1),
      dividerColor: MAIN_COLOR,
      buttonColor: Color.fromRGBO(223, 230, 233, 1),
      focusColor: MAIN_COLOR,
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
        headline3: TextStyle(
            fontSize: 26,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.bold),
        button: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.normal),
        bodyText1: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.normal),
        bodyText2: TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(99, 110, 114, 1),
            fontWeight: FontWeight.normal),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(99, 110, 114, 1)),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MAIN_COLOR),
              borderRadius: BorderRadius.circular(15))));
}

TextTheme homeTextTheme() {
  return TextTheme(
    headline1: TextStyle(
        fontSize: 32,
        color: Colors.white,
        fontWeight: FontWeight.bold),
    headline2: TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.normal),
    button: TextStyle(
        fontSize: 30,
        color: MAIN_COLOR,
        fontWeight: FontWeight.bold),
    bodyText1: TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.normal),
  );
}
