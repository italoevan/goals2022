import 'package:flutter/material.dart';
import 'package:goals_2022/modules/home/presenter/subpages/goals/goals_controller.dart';

class GoalsSubpage extends StatelessWidget {
  final GoalsController controller;

  const GoalsSubpage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  validator: controller.nameValidator,
                  decoration: const InputDecoration(label: Text("Name")),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.motivationalPhrase,
                  decoration:
                      const InputDecoration(label: Text("Motivational phrase")),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      label: Text("Icon"),
                      suffixIcon: Icon(Icons.ac_unit_outlined)),
                ),
                const SizedBox(
                  height: 24,
                ),
                Image.asset(
                  "lib/shared/assets/be_strong.png",
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "You can do this!",
                  style: TextStyle(fontSize: 26),
                )
              ],
            )),
      ),
    );
  }
}
