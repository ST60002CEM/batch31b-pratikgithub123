import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: false,
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: Colors.red[200],
    fontFamily: 'Times',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w200,
            fontFamily: 'Times'),
      ),
    ),
  );
}
