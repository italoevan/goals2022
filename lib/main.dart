import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/core/app_module.dart';
import 'package:goals_2022/shared/themes/app_theme.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppTheme.appTheme,
        builder: (context, widget) =>
            MaterialApp(theme: AppTheme.getCurrentTheme()).modular());
  }
}
