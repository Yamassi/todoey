import 'package:flutter/material.dart';
import 'package:todoey/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, TaskData, child) {
      return ListView.builder(
        itemBuilder: ((context, index) {
          final task = TaskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkBoxCallback: (newValue) {
              TaskData.updateTask(task);
            },
            removeTaskCallback: () {
              TaskData.deleteTask(task);
            },
          );
        }),
        itemCount: TaskData.taskCount,
      );
    });
  }
}
