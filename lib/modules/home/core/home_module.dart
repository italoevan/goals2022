import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/external/goal_dao_impl.dart';
import 'package:goals_2022/modules/home/core/consts/home_routes.dart';
import 'package:goals_2022/modules/home/presenter/pages/home.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_controller.dart';
import 'package:goals_2022/modules/home/presenter/subpages/goals/goals_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind((i) => HomeControllerImpl(Modular.get())),
        Bind((i) => GoalDaoImpl()),
        Bind((i) => GoalsControllerImpl(dao: Modular.get(), controller: Modular.get()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(HomeRoutes.root,
            child: (context, arg) => HomePage(
                  goalsController: Modular.get(),
                  controller: Modular.get<HomeController>(),
                ))
      ];
}
