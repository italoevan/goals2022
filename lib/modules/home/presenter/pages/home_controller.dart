import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_state.dart';

abstract class HomeController {
  abstract PageController pageContoller;
  void changePage(int index);
  abstract int currentIndex;
}

class HomeControllerImpl extends GetxController implements HomeController {
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
}
