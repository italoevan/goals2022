import 'package:flutter/material.dart';
import 'package:goals_2022/domain/entities/goal.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoalComponent extends StatefulWidget {
  final Goal goal;
  final Function(int) onTap;

  GoalComponent(this.goal, {Key? key, required this.onTap}) : super(key: key);

  @override
  State<GoalComponent> createState() => _GoalComponentState();
}

class _GoalComponentState extends State<GoalComponent> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.goal.id!);
      },
      child: Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.goal.name,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  widget.goal.motivationalPhrase != null
                      ? Text(
                          widget.goal.motivationalPhrase!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        )
                      : const SizedBox(),
                ],
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      widget.goal.done = ! widget.goal.done!;
                    });
                  },
                  icon: Icon(
                    Icons.done,
                    color: widget.goal.done! ? Colors.blue : Colors.white,
                  ))
            ],
          ),
        ]),
      ),
    );
  }
}
