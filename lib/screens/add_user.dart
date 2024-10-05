// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';

// import '../provider/task_provider.dart';

// class AddUserForm extends StatelessWidget {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = Provider.of<TaskProvider>(context);

//     return Column(
//       children: [
//         TextField(
//           controller: _controller,
//           decoration: InputDecoration(labelText: 'New User Name'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             taskProvider.addUser(_controller.text);
//             _controller.clear();
//           },
//           child: Text('Add User'),
//         ),
//       ],
//     );
//   }
// }
