import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/modules/home/core/consts/home_routes.dart';
import 'package:goals_2022/modules/home/presenter/pages/home.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_controller.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_state.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds =>
      [Bind((i) => HomeControllerImpl())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeRoutes.root,
            child: (context, arg) => HomePage(
                  controller: Modular.get<HomeController>(),
                ))
      ];
}
