import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  
  AppTheme._() {
    _getPersistedValue();
  }

  late SharedPreferences shared;
  bool? persistedValue;
  bool isDark = false;

  ///A singleton of Theme used to change app theme
  static final AppTheme appTheme = AppTheme._();

  void changeTheme() async {
    isDark = !isDark;
    shared.setBool("isDark", isDark);
    notifyListeners();
  }

  _getPersistedValue() async {
    shared = await SharedPreferences.getInstance();
    persistedValue = (shared.get("isDark") as bool);

    if (persistedValue == null) {
      persistedValue = false;
    } else {
      isDark = persistedValue ?? false;
      notifyListeners();
    }
  }

  static ThemeData getCurrentTheme() {
    var theme = AppTheme.appTheme.isDark
        ? ThemeData.dark().copyWith(
            textTheme: GoogleFonts.ralewayTextTheme(
                const TextTheme(bodyText1: TextStyle(color: Colors.white))))
        : ThemeData.light().copyWith(textTheme: GoogleFonts.ralewayTextTheme());
    return theme;
  }
}
