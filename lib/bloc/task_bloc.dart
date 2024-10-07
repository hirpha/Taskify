import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

// Assuming you've already defined your Task class and events as shown earlier.
import '../model/task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  /// {@macro task_bloc}
  ///
  final List<Task> _tasks = [...sampleTasks];
  TaskBloc() : super(TaskInitial()) {
    on<LoadTasks>((event, emit) {
      emit(TaskLoading());
      // Logic to load tasks could be here
      emit(TaskLoaded(_tasks)); // You might want to fetch tasks from a source
    });

    on<AddTask>((event, emit) {
      emit(TaskLoading());
      _tasks.add(event.task);
      emit(TaskLoaded(_tasks));
    });

    on<UpdateTask>((event, emit) {
      emit(TaskLoading());
      Task old =
          _tasks.firstWhere((element) => element.title == event.task.title);
      int index = _tasks.indexOf(old);
      _tasks[index].status = event.task.status;

      emit(TaskLoaded(_tasks));
    });

    on<DeleteTask>((event, emit) {
      // final updatedTasks =
      //     state.where((task) => task.order != event.taskId).toList();
      // emit(updatedTasks);
    });
  }
}
