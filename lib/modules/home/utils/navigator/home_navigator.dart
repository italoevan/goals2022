import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/modules/home/core/consts/home_routes.dart';

abstract class HomeNavigator {
  void toGoalEdit();
}

class HomeNavigatorImpl implements HomeNavigator {
  @override
  void toGoalEdit() {
    Modular.to.pushNamed(moduleName + HomeRoutes.editGoal);
  }
}
