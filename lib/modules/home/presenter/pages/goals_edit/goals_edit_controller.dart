import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';
import 'package:goals_2022/modules/home/presenter/pages/home/home_controller.dart';

abstract class GoalsEditController {
  Goal get goal;

  abstract TextEditingController motivationalController;
  abstract TextEditingController nameController;

  Future<void> save();
  Future<void> remove();
}

class GoalsEditControllerImpl implements GoalsEditController {
  final GoalDao dao = Modular.get();
  final HomeController controller = Modular.get<HomeController>();

  @override
  TextEditingController nameController =
      TextEditingController(text: (Modular.args.data as Goal).name);

  @override
  TextEditingController motivationalController = TextEditingController(
      text: (Modular.args.data as Goal).motivationalPhrase);

  @override
  Goal get goal => Modular.args.data;

  @override
  Future<void> save() async {
    await dao.update(Goal(
        name: nameController.text,
        motivationalPhrase: motivationalController.text,
        id: goal.id));
    controller.refreshPage();
  }

  @override
  Future<void> remove() async {
    await dao.delete(goal.id!);
    controller.refreshPage();
  }
}
