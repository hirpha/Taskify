// import 'package:flutter/material.dart';

// import '../model/task.dart';
// import '../model/user.dart';

// class TaskProvider with ChangeNotifier {
//   final List<Task> _workingTasks = [];
//   final List<Task> _completedTasks = [];
//   final List<User> _users = [User(name: "John Doe"), User(name: "Jane Smith")];

//   List<Task> get workingTasks => _workingTasks;
//   List<Task> get completedTasks => _completedTasks;
//   List<User> get users => _users;

//   void addTask(String title, String assignedTo) {
//     _workingTasks.add(Task(title: title, assignedTo: assignedTo));
//     notifyListeners();
//   }

//   void moveTaskToCompleted(int index) {
//     Task task = _workingTasks.removeAt(index);
//     task.isCompleted = true;
//     _completedTasks.add(task);
//     notifyListeners();
//   }

//   void addUser(String name) {
//     _users.add(User(name: name));
//     notifyListeners();
//   }
// }
