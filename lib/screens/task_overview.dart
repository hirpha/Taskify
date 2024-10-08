import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/bloc/task_state.dart';
import 'package:task_manager/shared/app_bar.dart';

import '../bloc/task_event.dart';
import '../shared/task_category.dart';
import '../shared/task_list.dart';
import '../shared/task_timeline_widget.dart';

class TaskOverviewScreen extends StatefulWidget {
  @override
  State<TaskOverviewScreen> createState() => _TaskOverviewScreenState();
}

class _TaskOverviewScreenState extends State<TaskOverviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(LoadTasks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 31, 31),
                  borderRadius: BorderRadius.circular(49),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your task...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, size: 30, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Timeline",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [Text("October"), Icon(Icons.arrow_drop_down)],
                  )
                ],
              ),
            ),
            // Horizontal Timeline
            TimelineWidget(),

            // Task Categories
            TaskCategoryWidget(),

            // Bottom Task List
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Task",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10),

                  BlocBuilder<TaskBloc, TaskState>(builder: (context, state) {
                    if (state is TaskLoaded) {
                      return Column(
                        children: state.tasks
                            .map((task) => TaskListWidget(
                                  task: task,
                                ))
                            .toList(),
                      );
                    }
                    return SizedBox();
                  })
                  // TaskListWidget(),
                  // TaskListWidget(),
                  // TaskListWidget(),
                  // TaskListWidget(),
                  // TaskListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
