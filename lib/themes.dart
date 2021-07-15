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
      ),
    ).apply(
      bodyColor: isDark ? Colors.white : Colors.black,
      displayColor: isDark ? Colors.white : Colors.black,
    ),
  );
}
