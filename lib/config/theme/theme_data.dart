import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.lightBlue,
    scaffoldBackgroundColor: Colors.blue[100],
    fontFamily: 'Times',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontFamily: 'fairplay'),
      ),
    ),
  );
}
