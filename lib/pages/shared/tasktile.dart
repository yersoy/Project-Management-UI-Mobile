import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  final String? name;
  final bool? isChecked;
  final Function(bool?)? onChangedCallback;
  final Function()? longPressCallback;
  const TaskListTile({this.name, this.isChecked, this.onChangedCallback, this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(0.0),
        side: const BorderSide(color: Colors.white),
      ),
      onPressed: () {},
      onLongPress: longPressCallback,
      child: CheckboxListTile(
        dense: true,
        selected: isChecked!,
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.lightBlueAccent,
        title: Text(
          name!,
          style: TextStyle(fontWeight: FontWeight.bold, decoration: isChecked! ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        value: isChecked,
        onChanged: onChangedCallback,
      ),
    );
  }
}
