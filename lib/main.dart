import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/screens/manage_task.dart';
import 'package:task_manager/screens/new_task.dart';
import 'package:task_manager/screens/task_manager_home.dart';
import 'screens/task_overview.dart';

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepOrange,
          primaryColor: Colors.deepOrange,
          fontFamily: 'GoogleFonts.poppins().fontFamily',
        ),
        onGenerateRoute: (settings) {
          if (settings.name == NewTask.routeName) {
            return MaterialPageRoute(builder: (context) {
              return NewTask();
            });
          }
          if (settings.name == ManageTaskPage.routeName) {
            return MaterialPageRoute(builder: (context) {
              return ManageTaskPage();
            });
          }
        },
        home: TaskManagerHome(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
