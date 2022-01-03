import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/core/consts/app_routes.dart';
import 'package:goals_2022/modules/home/core/home_module.dart';
import 'package:goals_2022/presenter/splash_controller.dart';
import 'package:goals_2022/presenter/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [Bind((i) => SplashControllerImpl())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.splash,
            child: (context, arg) => SplashScreen(
                  controller: Modular.get(),
                )),
        ModuleRoute(AppRoutes.home, module: HomeModule())
      ];
}
