// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../model/task.dart';
// import '../provider/task_provider.dart';

// class TaskList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = Provider.of<TaskProvider>(context);

//     return Row(
//       children: [
//         Expanded(
//           child: Column(
//             children: [
//               Text('Working Tasks'),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: taskProvider.workingTasks.length,
//                   itemBuilder: (context, index) {
//                     final task = taskProvider.workingTasks[index];
//                     return Draggable<Task>(
//                       data: task,
//                       child: TaskCard(task: task),
//                       feedback: Material(
//                         child: TaskCard(task: task),
//                       ),
//                       childWhenDragging: Container(),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: Column(
//             children: [
//               Text('Completed Tasks'),
//               Expanded(
//                 child: DragTarget<Task>(
//                   onAccept: (task) {
//                     taskProvider.moveTaskToCompleted(taskProvider.workingTasks.indexOf(task));
//                   },
//                   builder: (context, candidateData, rejectedData) {
//                     return ListView.builder(
//                       itemCount: taskProvider.completedTasks.length,
//                       itemBuilder: (context, index) {
//                         final task = taskProvider.completedTasks[index];
//                         return TaskCard(task: task);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class TaskCard extends StatelessWidget {
//   final Task task;
//   TaskCard({required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(task.title),
//         subtitle: Text('Assigned to: ${task.assignedTo}'),
//       ),
//     );
//   }
// }
