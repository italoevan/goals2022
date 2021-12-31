import 'package:flutter/cupertino.dart';

class Goal {
  int? id;
  bool? done;
  String name;
  String? motivationalPhrase;
  IconData? icon;

  Goal.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        done = map['done'],
        name = map['name'],
        motivationalPhrase = map['motivationalPhrase'],
        icon = map['icon'];

  Goal(
      {this.id,
      required this.name,
      required this.icon,
      required this.motivationalPhrase});

  Map<String, dynamic> toMap() {
    return {
      "done": this.done,
      "name": this.name,
      "motivationalPhrase": this.motivationalPhrase,
      "icon": this.icon
    };
  }
}
