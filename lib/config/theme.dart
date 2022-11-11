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
        color: Color(0xffEEEEEE), fontSize: 35, fontWeight: FontWeight.bold),
    headline2: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 29, fontWeight: FontWeight.bold),
    headline3: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 25, fontWeight: FontWeight.bold),
    headline4: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 23, fontWeight: FontWeight.bold),
    headline5: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 21, fontWeight: FontWeight.bold),
    headline6: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 21, fontWeight: FontWeight.normal),
    bodyText1: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 17, fontWeight: FontWeight.normal),
    bodyText2: TextStyle(
        color: Color(0xffEEEEEE), fontSize: 15, fontWeight: FontWeight.normal),
  );
}


//https://colorhunt.co/palette/222831393e4600adb5eeeeee