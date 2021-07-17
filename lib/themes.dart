import 'package:flutter/material.dart';

final lightTheme = _buildTheme(Brightness.light);
final darkTheme = _buildTheme(Brightness.dark);

ThemeData _buildTheme(Brightness brightness) {
  final isDark = Brightness.dark == brightness;

  return ThemeData(
    primaryColor: isDark ? Colors.black : Colors.white,
    scaffoldBackgroundColor: isDark ? Colors.black : Colors.white,
    hintColor: isDark ? Colors.white : Colors.grey[700],
    cardColor: isDark ? Colors.grey[800] : Colors.grey[300],
    iconTheme: IconThemeData(
      color: isDark ? Colors.white : Colors.black,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: isDark
            ? MaterialStateProperty.all(Colors.white)
            : MaterialStateProperty.all(Colors.black),
        overlayColor: MaterialStateProperty.all(
          isDark
              ? Colors.white.withOpacity(0.2)
              : Colors.black.withOpacity(0.2),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: isDark ? Colors.white : Colors.black,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: isDark ? Colors.grey[900] : Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: isDark ? Colors.white : Colors.black,
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headline6: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),
        subtitle1: TextStyle(
          fontWeight: FontWeight.bold,
        )).apply(
      bodyColor: isDark ? Colors.white : Colors.black,
      displayColor: isDark ? Colors.white : Colors.black,
    ),
  );
}
