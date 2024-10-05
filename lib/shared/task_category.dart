import 'package:flutter/material.dart';

class TaskCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'UNIQLO Workspace',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Meeting with UNIQLO',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Daily Report',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shared Workspace',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'POS Foodie Workspace',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'UNIQLO Workspace',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
