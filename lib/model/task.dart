import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final DateTime dueDate;
  final DateTime endDate;
  final String workspace;
  bool status;
  final int order;
  final TimeOfDay dailyTime;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    required this.endDate,
    required this.workspace,
    required this.order,
    required this.status,
    required this.dailyTime,
  });
}

final List<Task> sampleTasks = [
  Task(
      title: "Complete Flutter BLoC Tutorial",
      description: "Finish writing the BLoC tutorial for task management.",
      dueDate:
          DateTime(2024, 10, 10, 17, 0), // Due on October 10, 2024, at 5:00 PM
      endDate: DateTime(2024, 10, 10, 18, 0), // Ends at 6:00 PM
      workspace: "Personal",
      status: false, // Not completed
      order: 1,
      dailyTime: const TimeOfDay(hour: 1, minute: 0)),
  Task(
      title: "Prepare Presentation for Team Meeting",
      description: "Create slides for the upcoming team meeting.",
      dueDate:
          DateTime(2024, 10, 15, 9, 0), // Due on October 15, 2024, at 9:00 AM
      endDate: DateTime(2024, 10, 15, 10, 0), // Ends at 10:00 AM
      workspace: "Office",
      status: false, // Not completed
      order: 2,
      dailyTime: const TimeOfDay(hour: 2, minute: 0)),
  Task(
      title: "Grocery Shopping",
      description: "Buy groceries for the week.",
      dueDate:
          DateTime(2024, 10, 7, 10, 0), // Due on October 7, 2024, at 10:00 AM
      endDate: DateTime(2024, 10, 7, 11, 0), // Ends at 11:00 AM
      workspace: "General",
      status: true, // Completed
      order: 8,
      dailyTime: const TimeOfDay(hour: 8, minute: 0)),
];
