import 'package:flutter/cupertino.dart';

class Goal {
  Goal(
      {required this.id,
      required this.name,
      required this.icon,
      required this.motivationalPhrase});
  final int id;
  String name;
  String motivationalPhrase;
  IconData icon;
}
