import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    //scaffoldBackgroundColor: const Color(0xff222831),
    fontFamily: 'Avenir',
    brightness: Brightness.dark,
    textTheme: textTheme(),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headline1: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 32, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 24, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 18, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 16, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 14, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 14, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 15, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 12, fontWeight: FontWeight.normal),
  );
}


//https://colorhunt.co/palette/222831393e4600adb5eeeeee