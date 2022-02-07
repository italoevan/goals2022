import 'package:flutter/material.dart';
import 'package:goals_2022/modules/home/presenter/pages/goals_edit/goals_edit_controller.dart';

class GoalsEditPage extends StatefulWidget {
  final GoalsEditController controller;

  const GoalsEditPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<GoalsEditPage> createState() => _GoalsEditPageState();
}

class _GoalsEditPageState extends State<GoalsEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit "),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: "Name"),
            controller: widget.controller.nameController,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: "Motivational phrase"),
            controller: widget.controller.motivationalController,
          ),
          ElevatedButton(onPressed: widget.controller.save, child: const Text("Save"))
        ],
      ),
    );
  }
}
