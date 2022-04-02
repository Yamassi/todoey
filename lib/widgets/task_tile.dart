import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkBoxCallback;
  final Function() removeTaskCallback;

  TaskTile(
      {Key? key,
      this.isChecked = false,
      required this.taskTitle,
      required this.checkBoxCallback,
      required this.removeTaskCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null)),
      trailing: Checkbox(
        activeColor: Colors.lightBlue,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
      onLongPress: removeTaskCallback,
    );
  }
}
