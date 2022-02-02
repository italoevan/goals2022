import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';

abstract class HomeController {
  void refreshPage();
  abstract PageController pageContoller;
  void changePage(int index);
  abstract List<Goal> goals;
  abstract int currentIndex;
  abstract bool isLoading;
}

class HomeControllerImpl implements HomeController {
  final GoalDao dao;
  var _isLoading = false.obs;

  @override
  void refreshPage() async => await _read();

  HomeControllerImpl(this.dao) {}

  var index = 0.obs;

  @override
  PageController pageContoller = PageController();

  @override
  set currentIndex(int _currentIndex) {
    index.value = _currentIndex;
  }

  @override
  int get currentIndex => index.value;

  @override
  void changePage(int _index) {
    index.value = _index;
    pageContoller.animateToPage(_index,
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
