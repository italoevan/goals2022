import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';

abstract class HomeController {
  void refreshPage();
  abstract PageController pageController;
  void changePage(int index);
  abstract List<Goal> goals;
  abstract int currentIndex;
  abstract bool isLoading;
  String get doneText;
  double get donePercentage;
}

class HomeControllerImpl implements HomeController {
  final GoalDao dao;
  // ignore: prefer_final_fields
  var _isLoading = false.obs;

  @override
  void refreshPage() async => await _read();

  HomeControllerImpl(this.dao) {}

  var index = 0.obs;

  @override
  PageController pageController = PageController();

  @override
  set currentIndex(int _currentIndex) {
    index.value = _currentIndex;
  }

  @override
  String get doneText{

    int _dones = 0;
    int _goalsLengh = goals.length;

    for (Goal element in goals) {
      element.done! ? _dones+= 1 : DoNothingAction();
    }

    return "$_dones / $_goalsLengh";

  }

  @override
  double get donePercentage{

    int _dones = 0;
    int _goalsLengh = goals.length;

    goals.forEach((element) {
      element.done! ? _dones+= 1 : DoNothingAction();
    });

    return (_dones * 100) / _goalsLengh;

  }

  @override
  int get currentIndex => index.value;

  @override
  void changePage(int _index) {
    index.value = _index;
    pageController.animateToPage(_index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeOutExpo);
  }

  Future<void> _read() async {
    isLoading = true;
    try {
      var value = await dao.read();
      goals = value ?? [];
    } catch (e) {
      print(e);
    }
    isLoading = false;
  }

  var teste = false.obs;

  @override
  bool get isLoading => _isLoading.value;

  @override
  set isLoading(bool value) {
    _isLoading.value = value;
  }

  @override
  List<Goal> goals = <Goal>[];
}
