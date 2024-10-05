import 'package:flutter/material.dart';
import 'package:task_manager/shared/app_bar.dart';

import '../shared/task_category.dart';
import '../shared/task_list.dart';
import '../shared/task_timeline_widget.dart';

class TaskOverviewScreen extends StatelessWidget {
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
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your task...',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.white),
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
                    children: [Text("June"), Icon(Icons.arrow_drop_down)],
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
                  TaskListWidget(),
                  TaskListWidget(),
                  TaskListWidget(),
                  TaskListWidget(),
                  TaskListWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
