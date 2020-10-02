import 'package:flutter/material.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() {
  runApp(TodoeyApp());
}

class TodoeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TasksScreen(),
    );
  }
}
