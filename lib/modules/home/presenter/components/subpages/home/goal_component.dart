import 'package:flutter/material.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoalComponent extends StatelessWidget {
  final Goal goal;
  final Function(int)? onTap;

  const GoalComponent(this.goal, {Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 70,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            )
          ],
          gradient: const LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color(0xffDC1C13),
                Color(0xffEA4C46),
                Color(0xffF07470)
              ]),
          border: Border.all(color: Colors.red[200]!, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(children: [
        Center(
          child: Opacity(
            opacity: 0.4,
            child: SvgPicture.asset(
              "lib/shared/assets/work_back.svg",
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              goal.name,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            goal.motivationalPhrase != null
                ? Text(
                    goal.motivationalPhrase!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  )
                : const SizedBox()
          ],
        )
      ]),
    );
  }
}
