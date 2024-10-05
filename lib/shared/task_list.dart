import 'package:flutter/material.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          ListTile(
            title: Text(
              'Meeting with UNIQLO',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            subtitle: Text(
              'Prepare meeting with them at 09:00 PM',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: Icon(Icons.check_circle_outline, color: Colors.white),
          ),
          // Add more task items as needed
        ],
      ),
    );
  }
}
