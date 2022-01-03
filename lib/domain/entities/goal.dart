import 'package:flutter/material.dart';

class Goal {
  int? id;
  bool? done;
  String name;
  String? motivationalPhrase;

  Goal.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        done = map['done'] == 1 ? true : false,
        name = map['name'],
        motivationalPhrase = map['motivationalPhrase'];

  Goal({this.id, required this.name, required this.motivationalPhrase});

  Map<String, dynamic> toMap() {
    bool? _done = done;

    return {
      "done": _done != null && _done ? 1 : 0,
      "name": this.name,
      "motivationalPhrase": this.motivationalPhrase,
    };
  }
}
