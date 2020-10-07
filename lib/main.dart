import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(TaskAdapter());
  runApp(TodoeyApp());
}

class TodoeyApp extends StatefulWidget {
  @override
  _TodoeyAppState createState() => _TodoeyAppState();
}

class _TodoeyAppState extends State<TodoeyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
          home: FutureBuilder(
        future: Hive.openBox('tasks'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) if (snapshot
              .hasError)
            return Text(snapshot.error.toString());
          else
            return TasksScreen();
          return Scaffold();
        },
      )
          //
          ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
