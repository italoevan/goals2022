import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/modules/home/presenter/components/subpages/home/goal_component.dart';
import 'package:goals_2022/modules/home/presenter/pages/home/home_controller.dart';
import 'package:goals_2022/modules/home/utils/navigator/home_navigator.dart';
import 'package:goals_2022/shared/themes/app_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeSubpage extends StatefulWidget {
  final HomeController controller;
  final HomeNavigator navigator = Modular.get();
  HomeSubpage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeSubpage> createState() => _HomeSubpageState();
}

class _HomeSubpageState extends State<HomeSubpage> {
  @override
  void initState() {
    widget.controller.refreshPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: AppTheme.appTheme,
            builder: (context, widget) => Container(
                  height: 200,
                  color: AppTheme.appTheme.isDark
                      ? Theme.of(context).hoverColor
                      : Colors.blue,
                )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Good luck"),
              const SizedBox(
                height: 10,
              ),
              _buildProgressWidget(context, widget.controller),
              const SizedBox(
                height: 16,
              ),
              Obx(() => widget.controller.isLoading
                  ? Container()
                  : _buildGoalsList(widget.controller.goals)),
            ],
          ),
        )
      ],
    );
  }

  ValueListenableBuilder _buildProgressWidget(
      BuildContext context, HomeController controller) {
    ValueNotifier _isClosed = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: _isClosed,
        builder: (context, _, w) {
          switch (_isClosed.value) {
            case true:
              return Center(
                child: SizedBox(
                  height: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_downward_outlined),
                    onPressed: () => _isClosed.value = false,
                  ),
                ),
              );
            case false:
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.9)),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(() => controller.isLoading
                            ? Container()
                            : CircularPercentIndicator(
                                animation: true,
                                center: Image.asset(
                                  "lib/shared/assets/rocket.png",
                                  height: 55,
                                ),
                                radius: 100,
                                percent: controller.donePercentage,
                              )),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Obx(() => controller.isLoading
                                ? const Text("")
                                : Text(
                                    "Done ${controller.doneText}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            color: Colors.white, fontSize: 20),
                                  ))),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: IconButton(
                          onPressed: () => _isClosed.value = true,
                          icon: const Icon(Icons.arrow_upward_outlined)),
                    )
                  ],
                ),
              );
          }
          return Container();
        });
  }

  Widget _buildGoalsList(List<Goal>? list) {
    if (list != null && list.isEmpty) {
      return const Text("Empty Goals");
    }

    return Expanded(
      child: ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: list!.length,
          separatorBuilder: (context, index) => const Divider(
                color: Colors.transparent,
              ),
          itemBuilder: (context, index) {
            return GoalComponent(list[index],
                iconTap: widget.controller.iconTap,
                onTap: (value) => widget.navigator
                    .toGoalEdit(arg: widget.controller.goals[index]));
          }),
    );
  }
}
