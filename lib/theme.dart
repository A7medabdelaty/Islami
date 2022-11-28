import 'package:flutter/material.dart';

class MyTheme {
  static Color mainGold = const Color.fromRGBO(183, 147, 95, 1.0);
  static Color secondGold = const Color.fromRGBO(183, 147, 95, 0.60);
  static Color mainBlack = const Color.fromRGBO(36, 36, 36, 1.0);
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(bodyText1: TextStyle(fontSize: 30)),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(36, 36, 36, 1.0),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Color.fromRGBO(36, 36, 36, 1.0),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(183, 147, 95, 1.0),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
      ));
}
