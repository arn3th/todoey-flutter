import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final Function toggleCheckboxCallback;
  TasksList({this.tasks, this.toggleCheckboxCallback});

  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              this.toggleCheckboxCallback(index);
            });
      },
      itemCount: tasks.length,
    );
  }
}
