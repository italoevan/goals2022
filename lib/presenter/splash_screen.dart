import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/core/consts/app_routes.dart';
import 'package:goals_2022/presenter/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller;
  SplashScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3),
        () => Modular.to.pushReplacementNamed(AppRoutes.home));

    return const Scaffold(
      body: Text("Splash"),
    );
  }
}
