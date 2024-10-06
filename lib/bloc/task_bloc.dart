import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

// Assuming you've already defined your Task class and events as shown earlier.
import '../model/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  /// {@macro task_bloc}
  ///
  List<Task> _tasks = [];
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      // Logic to load tasks could be here
      emit(TaskLoaded(_tasks)); // You might want to fetch tasks from a source
    });

    on<AddTask>((event, emit) {
      _tasks.add(event.task);
      emit(TaskLoaded(_tasks));
    });

    on<UpdateTask>((event, emit) {
      // final updatedTasks = state.map((task) {
      //   return task.title == event.task.title ? event.task : task;
      // }).toList();
      // emit(updatedTasks);
    });

    on<DeleteTask>((event, emit) {
      // final updatedTasks =
      //     state.where((task) => task.order != event.taskId).toList();
      // emit(updatedTasks);
    });
  }
}
