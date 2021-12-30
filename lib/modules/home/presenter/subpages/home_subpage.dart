import 'package:flutter/material.dart';
import 'package:goals_2022/shared/themes/app_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeSubpage extends StatefulWidget {
  const HomeSubpage({Key? key}) : super(key: key);

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
              _buildProgressWidget(context),
            ],
          ),
        )
      ],
    );
  }
}

Widget _buildProgressWidget(BuildContext context) {
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
          percent: 0.29,
        )
      ],
    ),
  );
}
