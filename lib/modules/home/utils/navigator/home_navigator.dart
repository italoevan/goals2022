import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/modules/home/core/consts/home_routes.dart';

abstract class HomeNavigator {
  void toGoalEdit({dynamic arg});
}

class HomeNavigatorImpl implements HomeNavigator {
  @override
  void toGoalEdit({dynamic arg}) {
    Modular.to.pushNamed(moduleName + HomeRoutes.editGoal, arguments: arg);
  }
}
