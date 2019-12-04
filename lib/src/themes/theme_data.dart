import 'package:flutter/material.dart';

final ThemeData kEventsTheme = _buildEventsTheme();

ThemeData _buildEventsTheme() {
  return ThemeData(
    primaryColor: Color(0xff5c2aa0),
    accentColor: Color(0xff32198f),
    canvasColor: Color(0xffF2F2F2),
    errorColor: Colors.red[900],
    textTheme: TextTheme(
      title: TextStyle(
        fontFamily: 'GTE',
        color: Colors.black,
        fontSize: 23,
      ),
      display1: TextStyle(
        fontFamily: 'GTE',
        color: Colors.black,
        fontSize: 12,
      ),
      display2: TextStyle(
        fontFamily: 'GTE',
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 14,
      ),
      display3: TextStyle(
        fontFamily: 'GTE',
        color: Colors.black,
        fontSize: 16,
      ),
      display4: TextStyle(
        fontFamily: 'GTE',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
    ),
  );
}
