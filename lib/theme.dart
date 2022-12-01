import 'package:flutter/material.dart';

class MyTheme {
  static Color mainGold = const Color.fromRGBO(183, 147, 95, 1.0);
  static Color mainDark = const Color.fromRGBO(20, 26, 46, 1.0);
  static Color secondDark = const Color.fromRGBO(20, 26, 46, 1.0);
  static Color secondGold = const Color.fromRGBO(183, 147, 95, 1.0);
  static Color secondYellowDark = const Color.fromRGBO(250, 204, 29, 1.0);
  static Color mainBlack = const Color.fromRGBO(36, 36, 36, 1.0);
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: mainGold,
        onPrimary: Colors.white,
        secondary: mainBlack,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: Colors.white,
        surface: Colors.grey,
        onSurface: Colors.white),
    textTheme: const TextTheme(bodyText1: TextStyle(fontSize: 30)),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyTheme.mainGold, size: 35),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(36, 36, 36, 1.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondGold,
      selectedItemColor: mainBlack,
      unselectedItemColor: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: mainDark,
        onPrimary: Colors.white,
        secondary: secondYellowDark,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: Colors.white,
        background: Colors.transparent,
        onBackground: Colors.white,
        surface: Colors.grey,
        onSurface: Colors.white),
    textTheme: const TextTheme(bodyText1: TextStyle(fontSize: 30)),
    scaffoldBackgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: MyTheme.mainGold, size: 35),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 30,
        color: Color.fromRGBO(36, 36, 36, 1.0),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: secondDark,
      selectedItemColor: secondYellowDark,
      unselectedItemColor: Colors.white,
    ),
  );
}
