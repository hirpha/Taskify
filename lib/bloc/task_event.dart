import 'package:equatable/equatable.dart';

import '../model/task.dart';

abstract class TaskEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTasks extends TaskEvent {}

class AddTask extends TaskEvent {
  final Task task;

  AddTask(this.task);

  @override
  List<Object> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  UpdateTask(this.task);

  @override
  List<Object> get props => [task];
}

class DeleteTask extends TaskEvent {
  final int taskId; // You might want to use a unique identifier for tasks.

  DeleteTask(this.taskId);

  @override
  List<Object> get props => [taskId];
}
