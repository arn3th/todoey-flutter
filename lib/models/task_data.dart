import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  final _tasks = Hive.box('tasks');

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(int index) {
    _tasks.get(index).toggleDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.get(index)(index);
    notifyListeners();
  }

  String getTaskName(int index) {
    return _tasks.get(index).name;
  }

  bool isTaskDone(int index) {
    return _tasks.get(index).isDone;
  }
}
