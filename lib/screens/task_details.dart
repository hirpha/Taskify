// import 'package:flutter/material.dart';
// import '../shared/task_timeline_widget.dart'; 

// class TaskDetailsScreen extends StatelessWidget {
//   final String taskTitle;
//   TaskDetailsScreen({required this.taskTitle});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(taskTitle),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('04 June 2023', style: TextStyle(fontSize: 18, color: Colors.white)),
//           Text('You have total 4 tasks today', style: TextStyle(color: Colors.grey)),
//           Expanded(
//             child: ListView(
//               children: [
//                 TaskTimelineWidget(taskTitle: 'Landing page for TRIPPIES', hours: '5h'),
//                 TaskTimelineWidget(taskTitle: 'UNIQLO Workspace', hours: '2h'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
