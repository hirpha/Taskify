import 'package:flutter/material.dart';
import 'package:task_manager/screens/new_task.dart';
import 'package:task_manager/screens/task_manager_home.dart';
import 'screens/task_overview.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
        fontFamily: 'GoogleFonts.poppins().fontFamily',
      ),
      onGenerateRoute: (settings) {
        if (settings.name == NewTask.routeName) {
          return MaterialPageRoute(builder: (context) {
            return NewTask();
          });
        }
      },
      home: TaskManagerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
