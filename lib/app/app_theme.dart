import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'OpenSans',
    backgroundColor: Color(0xFFF96302),
    primaryColor: const Color(0xFFF96302),
    accentColor: const Color(0xFFF96302),
    cardColor: Color(0xFFF5F5F5),
    buttonTheme: ButtonThemeData(
      minWidth: double.infinity,
      buttonColor: const Color(0xFFF96302),
      padding: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      textTheme: ButtonTextTheme.accent,
      colorScheme:
          ThemeData.light().colorScheme.copyWith(secondary: Colors.white),
    ),
    textTheme: const TextTheme(
      button: const TextStyle(fontSize: 16.0),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'OpenSans',
    primaryColor: const Color(0xFFF96302),
    accentColor: const Color(0xFFF96302),
    buttonTheme: ButtonThemeData(
      minWidth: double.infinity,
      buttonColor: const Color(0xFFF96302),
      padding: const EdgeInsets.all(15.0),
    ),
    textTheme: const TextTheme(
      button: const TextStyle(fontSize: 16.0),
    ),
  );
}
