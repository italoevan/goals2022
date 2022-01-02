import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/external/goal_dao_impl.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_controller.dart';
import 'package:goals_2022/modules/home/presenter/subpages/goals/goals_controller.dart';
import 'package:goals_2022/modules/home/presenter/subpages/goals/goals_subpage.dart';
import 'package:goals_2022/modules/home/presenter/subpages/home_subpage.dart';
import 'package:goals_2022/shared/themes/app_theme.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  final GoalsController goalsController;
  const HomePage({
    Key? key,
    required this.controller,
    required this.goalsController,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("2022 Goals"),
          centerTitle: true,
          elevation: 0,
          actions: [
            Obx(() => _isHome(widget.controller.currentIndex == 0)
                ? AnimatedBuilder(
                    animation: AppTheme.appTheme,
                    builder: (context, widget) => FlutterSwitch(
                        activeIcon: const Icon(
                          Icons.nightlight_round,
                          color: Colors.blue,
                        ),
                        inactiveIcon: const Icon(
                          Icons.wb_sunny_sharp,
                          color: Colors.orange,
                        ),
                        value: AppTheme.appTheme.isDark,
                        onToggle: (v) => AppTheme.appTheme.changeTheme()))
                : IconButton(onPressed: () => widget.goalsController.saveNewGoal(), icon: const Icon(Icons.save)))
          ],
        ),
        body: PageView(
          controller: widget.controller.pageContoller,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeSubpage(
              controller: widget.controller,
            ),
            GoalsSubpage(
              controller: widget.goalsController,
            )
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
                onTap: (v) {
                  widget.controller.changePage(v);
                },
                currentIndex: widget.controller.currentIndex,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.flag), label: "Goals")
                ])));
  }

  bool _isHome(bool value) {
    return value;
  }
}
