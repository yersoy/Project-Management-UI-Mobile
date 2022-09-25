import 'package:flutter/cupertino.dart';

class TaskStatus {
  Color color;
  String name;
  TaskStatus({required this.color, required this.name});
  factory TaskStatus.fromJson(Map<String, dynamic> json) => TaskStatus(
        color: json["color"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "color": color,
        "name": name,
      };
}
