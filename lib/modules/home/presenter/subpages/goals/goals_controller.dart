import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';
import 'package:flutter/material.dart';

abstract class GoalsController {
  abstract Goal? goal;
  abstract GlobalKey<FormState> formKey;
  abstract TextEditingController nameController;
  abstract TextEditingController motivationalPhrase;
  String? nameValidator(String? name);
  Future saveNewGoal();
}

class GoalsControllerImpl extends GetxController implements GoalsController {
  final GoalDao dao;

  @override
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  TextEditingController motivationalPhrase = TextEditingController();

  @override
  TextEditingController nameController = TextEditingController();

  GoalsControllerImpl({required this.dao});

  @override
  Goal? goal;

  @override
  Future saveNewGoal() async {
    _mount();
    await dao.insert(goal!);
    _clean();
  }

  void _mount() {
    goal = Goal(
        name: nameController.text,
        motivationalPhrase:
            motivationalPhrase.text == "" ? null : motivationalPhrase.text);
  }

  void _clean() {
    motivationalPhrase.clear();
    nameController.clear();
  }

  @override
  String? nameValidator(String? name) {
    if (name != null) {
      if (name.length < 3) {
        return "Invalid name size";
      }
    }
  }
}
