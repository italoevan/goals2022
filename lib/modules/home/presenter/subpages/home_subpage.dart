import 'package:flutter/material.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:goals_2022/modules/home/presenter/components/subpages/home/goal_component.dart';
import 'package:goals_2022/modules/home/presenter/pages/home_controller.dart';
import 'package:goals_2022/shared/themes/app_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeSubpage extends StatefulWidget {
  final HomeController controller;
  const HomeSubpage({Key? key, required this.controller}) : super(key: key);

  @override
  State<HomeSubpage> createState() => _HomeSubpageState();
}

class _HomeSubpageState extends State<HomeSubpage> {
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
              FutureBuilder(
                  future: widget.controller.read(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Container();
                        break;
                      case ConnectionState.waiting:
                        return Container();
                        break;
                      case ConnectionState.active:
                        return Container();
                        break;
                      case ConnectionState.done:
                        return snapshot.data != null
                            ? _buildGoalsList(snapshot.data as List<Goal>?)
                            : Container();
                        break;
                    }

                    return Container();
                  })
            ],
          ),
        )
      ],
    );
  }
}

Widget _buildGoalsList(List<Goal>? list) {
  if (list != null && list.isEmpty) {
    return const Text("Empty Goals");
  }

  return Expanded(
    child: ListView.separated(
        itemCount: list!.length,
        separatorBuilder: (context, index) => const Divider(
              color: Colors.transparent,
            ),
        itemBuilder: (context, index) {
          if (list != null) {
            return GoalComponent(list[index]);
          }
          return Container();
        }),
  );
}

Widget _buildProgressWidget(BuildContext context, HomeController controller) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 300,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.9)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularPercentIndicator(
          animation: true,
          center: Image.asset(
            "lib/shared/assets/rocket.png",
            height: 55,
          ),
          radius: 100,
          percent: 0.9,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: controller.read(),
            builder: (context, AsyncSnapshot<List<Goal>?> snapshot) {
              if (snapshot.data != null) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(
                    "Goals ${snapshot.data!.length}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: Colors.white, fontSize: 20),
                  );
                }
              }

              return const Text("");
            })
      ],
    ),
  );
}
