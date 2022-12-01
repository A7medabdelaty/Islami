import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  String language = 'ar';

  void changeLanguage(String lang) {
    language = lang;
    notifyListeners();
  }

  ThemeMode theme = ThemeMode.light;

  void changeTheme(String theme) {
    if (theme == "light") {
      this.theme = ThemeMode.light;
    } else if (theme == 'dark') {
      this.theme = ThemeMode.dark;
    } else {
      this.theme = ThemeMode.system;
    }
    notifyListeners();
  }
}
