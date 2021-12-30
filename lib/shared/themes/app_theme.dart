import 'package:flutter/cupertino.dart';

class AppTheme extends ChangeNotifier {
  bool isDark = false;

  static final AppTheme appTheme = AppTheme();

  void changeTheme() {
    isDark = !isDark;
    debugPrint(isDark.toString());
    notifyListeners();
  }
}
