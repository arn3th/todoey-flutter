import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;

  AddTaskScreen({this.addTaskCallback});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(50.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
                print(newTaskTitle);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            FlatButton(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                addTaskCallback(newTaskTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}