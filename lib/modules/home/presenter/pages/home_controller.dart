import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/infra/datasource/goal_dao.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_state.dart';

abstract class HomeController  {
  void refreshPage();
  abstract PageController pageContoller;
  void changePage(int index);
  Future<List<Goal>?> read();
  abstract int currentIndex;
}

class HomeControllerImpl extends GetxController implements HomeController {
  final GoalDao dao;

  @override
  void refreshPage() async => await read();

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

  @override
  Future<List<Goal>?> read() async {
    var value = await dao.read();
    return value;
  }


}
