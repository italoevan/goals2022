import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  AppTheme() {
    _getPersistedValue();
  }
  late SharedPreferences shared;
  bool? persistedValue;
  bool isDark = false;

  static final AppTheme appTheme = AppTheme();

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
}
