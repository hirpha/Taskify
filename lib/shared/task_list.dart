import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/model/task.dart';

import '../bloc/task_event.dart';

class TaskListWidget extends StatelessWidget {
  final Task task;

  TaskListWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              task.title,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              task.description,
              style: TextStyle(color: Colors.grey),
            ),
            trailing: InkWell(
              onTap: () {
                // uppdateTask(task);
                task.status = !task.status;
                BlocProvider.of<TaskBloc>(context).add(UpdateTask(task));
              },
              child: Icon(
                  task.status
                      ? Icons.check_circle_outline
                      : Icons.circle_outlined,
                  color: Colors.white),
            ),
          ),
          // Add more task items as needed
        ],
      ),
    );
  }
}
