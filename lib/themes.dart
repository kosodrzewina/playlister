import 'package:flutter/material.dart';

final ThemeData darkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final base = ThemeData.dark();

  return base.copyWith(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    textTheme: _buildTextTheme(base.textTheme),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900],
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.white,
    ),
  );
}

TextTheme _buildTextTheme(TextTheme base) {
  return base
      .copyWith(
        bodyText1: base.bodyText1?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        bodyText2: base.bodyText2?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        headline4: base.headline4?.copyWith(
          fontWeight: FontWeight.bold,
        ),
        headline6: base.headline6?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      )
      .apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      );
}
