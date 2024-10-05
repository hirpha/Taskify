import 'package:flutter/material.dart';

import '../shared/dotted_pointer.dart';
import '../shared/task_timeline_widget.dart';
import 'new_task.dart';

class ManageTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Task'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Date selector at the top
          TimelineWidget(),
          // Timeline label
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Timeline',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
          // Task timeline section

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  _buildTimeline(),
                  // Tasks positioned on the timeline
                  Positioned(
                    top: 60, // Position based on 12:00 PM
                    left: 120,
                    child: _buildTaskCard(
                      title: "POS Foodie Workspace",
                      avatarUrl:
                          'https://via.placeholder.com/150', // Replace with the actual URL
                      duration: "00:48 h of 5 h",
                      schedule: "4-5 June",
                      color: Colors.purple,
                    ),
                  ),
                  Positioned(
                    top: 180, // Position based on 14:00 PM
                    left: 80,
                    child: _buildTaskCard(
                      title: "Landing page for TRIPPIES",
                      avatarUrl:
                          'https://via.placeholder.com/150', // Replace with the actual URL
                      duration: "00:48 h of 5 h",
                      schedule: "4-5 June",
                      color: Colors.green,
                    ),
                  ),
                  Positioned(
                    top: 300, // Position based on 16:00 PM
                    left: 60,
                    child: _buildTaskCard(
                      title: "UNIQLO Workspace",
                      avatarUrl:
                          'https://via.placeholder.com/150', // Replace with the actual URL
                      duration: "00:48 h of 5 h",
                      schedule: "2-14 June",
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Floating action button to add a new task
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Logic to create new task
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewTask()));
        },
        label: const Text('Create New Task'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.orange,
      ),
    );
  }

  // Helper method to build the timeline
  Widget _buildTimeline() {
    return Container(
      height: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(8, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Text(
                  '${10 + index}:00',
                  style: const TextStyle(color: Colors.white),
                ),
                Expanded(
                  child: CustomPaint(painter: DottedLinePainter()),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  // Helper method to build the task card widget
  Widget _buildTaskCard({
    required String title,
    required String avatarUrl,
    required String duration,
    required String schedule,
    required Color color,
  }) {
    return Container(
      width: 290,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color, width: 3),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
            radius: 20.0,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                duration,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                schedule,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
