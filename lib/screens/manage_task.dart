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
                  // _buildTimeline(),
                  _buildTask(),
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
      child: Row(
        // scrollDirection: Axis.horizontal,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(7, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: Column(
              children: [
                // Text(
                //   '${10 + index}:00',
                //   style: const TextStyle(color: Colors.white),
                // ),

                SizedBox(
                  height: 20,
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

  Widget _buildTask() {
    return Container(
      height: double.infinity, // Set a fixed height for the scrolling content
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align the time and tasks at the top
            children: [
              // Time slots and vertical lines for each hour

              // Tasks section with a Stack to overlay tasks
              Container(
                // width: 600, // Adjust width to allow scrolling
                child: Stack(
                  children: [
                    Row(
                      children: List.generate(24, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              Text(
                                '${1 + index}:00', // Time slots (e.g., 10:00, 11:00, etc.)
                                style: const TextStyle(color: Colors.white),
                              ),
                              // Optionally, add a vertical dotted line under each time slot
                              Expanded(
                                child:
                                    CustomPaint(painter: DottedLinePainter()),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                    ...List.generate(4, (index) {
                      return Positioned(
                        left: index * 70 + 30,
                        top: (130 * index + 30).toDouble(),
                        child: _buildTaskCard(
                          title: "POS Foodie Workspace",
                          avatarUrl: 'https://via.placeholder.com/150',
                          duration: "00:48 h of 5 h",
                          schedule: "4-5 June",
                          color: const Color.fromARGB(255, 98, 176, 39),
                        ),
                      );
                    }),
                    // Positioned(
                    //   left: 20,
                    //   top: 20,
                    //   child: _buildTaskCard(
                    //     title: "POS Foodie Workspace",
                    //     avatarUrl: 'https://via.placeholder.com/150',
                    //     duration: "00:48 h of 5 h",
                    //     schedule: "4-5 June",
                    //     color: Colors.purple,
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 120,
                    //   top: 120,
                    //   child: _buildTaskCard(
                    //     title: "Landing page for TRIPPIES",
                    //     avatarUrl: 'https://via.placeholder.com/150',
                    //     duration: "00:48 h of 5 h",
                    //     schedule: "4-5 June",
                    //     color: Colors.green,
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 20,
                    //   top: 220,
                    //   child: _buildTaskCard(
                    //     title: "UNIQUO Workspace",
                    //     avatarUrl: 'https://via.placeholder.com/150',
                    //     duration: "00:48 h of 5 h",
                    //     schedule: "4-5 June",
                    //     color: Colors.orange,
                    //   ),
                    // ),
                    // Positioned(
                    //   left: 300,
                    //   top: 320,
                    //   child: _buildTaskCard(
                    //     title: "UNIQUO Workspace",
                    //     avatarUrl: 'https://via.placeholder.com/150',
                    //     duration: "00:48 h of 5 h",
                    //     schedule: "4-5 June",
                    //     color: Colors.orange,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
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
      width: 280,
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
