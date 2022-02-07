import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/external/goal_dao_impl.dart';
import 'package:goals_2022/modules/home/core/consts/home_routes.dart';
import 'package:goals_2022/modules/home/presenter/pages/goals_edit/goals_edit_controller.dart';
import 'package:goals_2022/modules/home/presenter/pages/goals_edit/goals_edit_page.dart';
import 'package:goals_2022/modules/home/presenter/pages/home/home.dart';
import 'package:goals_2022/modules/home/presenter/pages/home/home_controller.dart';
import 'package:goals_2022/modules/home/presenter/subpages/goals/goals_controller.dart';
import 'package:goals_2022/modules/home/utils/navigator/home_navigator.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeControllerImpl(Modular.get())),
        Bind.singleton((i) => GoalDaoImpl()),
        Bind((i) =>
            GoalsControllerImpl(dao: Modular.get(), controller: Modular.get())),
        Bind.factory<GoalsEditController>((i) => GoalsEditControllerImpl()),
        Bind<HomeNavigator>((i) => HomeNavigatorImpl())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, arg) => HomePage(
                  goalsController: Modular.get(),
                  controller: Modular.get<HomeController>(),
                )),
        ChildRoute(HomeRoutes.editGoal,
            child: (context, arg) => GoalsEditPage(
                  controller: Modular.get(),
                ))
      ];
}
