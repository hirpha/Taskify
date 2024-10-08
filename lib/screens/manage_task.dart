import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/bloc/task_state.dart';

import '../bloc/task_event.dart';
import '../model/task.dart';
import '../shared/dotted_pointer.dart';
import '../shared/task_timeline_widget.dart';
import 'new_task.dart';

extension on TimeOfDay {
  String takeTimeAndHour() {
    return "${hour < 10 ? "0$hour" : hour}:${minute < 10 ? "0$minute" : minute}";
  }
}

class ManageTaskPage extends StatefulWidget {
  static const routeName = "ManageTaskPage";

  @override
  State<ManageTaskPage> createState() => _ManageTaskPageState();
}

class _ManageTaskPageState extends State<ManageTaskPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TaskBloc>(context).add(LoadTasks());
  }

  List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: MediaQuery.of(context).size.width * .2,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(182, 255, 255, 255)),
              child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ))),
        ),
        centerTitle: true,
        title: const Text('Manage Task',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        actions: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(117, 249, 249, 249)),
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
              child: IconButton(
                icon: const Icon(Icons.more_horiz,
                    color: Color.fromARGB(255, 0, 0, 0)),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: const Text('Manage Task'),
      //   centerTitle: true,
      //   backgroundColor: Colors.black,
      // ),
      body: Column(
        children: [
          // Date selector at the top
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '04 October 2023',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                  Text(
                    'You have total ${_tasks.length} tasks',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 158, 158, 158),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TimelineWidget(),
          // Timeline label

          SizedBox(
            height: 10,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton.extended(
          extendedPadding: EdgeInsets.symmetric(horizontal: 100),
          isExtended: true,
          onPressed: () {
            // Logic to create new task
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => NewTask()));
          },
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(50), // Customize the radius here
          ),
          label: const Text(
            'Create New Task',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          // icon: const Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor),
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

                const SizedBox(
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
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

                    ..._tasks
                        .map((task) => Positioned(
                              left: ((task.order - 1) * 72) + 33,
                              top: task.order <= 4
                                  ? (130 * (task.order - 1) + 30).toDouble()
                                  : (130 *
                                              ((task.order % 4 == 0
                                                      ? 4
                                                      : task.order % 4) -
                                                  1) +
                                          30)
                                      .toDouble(),
                              child: _buildTaskCard(
                                title: task.title,
                                avatarUrl:
                                    'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                duration: task.dailyTime,
                                schedule:
                                    "${task.dueDate.day}-${task.endDate.day} October",
                                color: !task.status
                                    ? Colors.red
                                    : const Color.fromARGB(255, 98, 176, 39),
                              ),
                            ))
                        .toList(),
                    BlocConsumer<TaskBloc, TaskState>(
                        listener: (context, state) {
                      if (state is TaskLoaded) {
                        _tasks = state.tasks;
                        setState(() {});
                      }
                    }, builder: (context, state) {
                      print(state);

                      return Container();
                    })
                    // ...List.generate(4, (index) {
                    //   return Positioned(
                    //     left: index * 70 + 30,
                    //     top: (130 * index + 30).toDouble(),
                    //     child: _buildTaskCard(
                    //       title: "POS Foodie Workspace",
                    //       avatarUrl:
                    //           'https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    //       duration: "00:48 h of 5 h",
                    //       schedule: "4-5 October",
                    //       color: index % 2 == 0
                    //           ? Colors.red
                    //           : const Color.fromARGB(255, 98, 176, 39),
                    //     ),
                    //   );
                    // }),
                    // Positioned(
                    //   left: 20,
                    //   top: 20,
                    //   child: _buildTaskCard(
                    //     title: "POS Foodie Workspace",
                    //     avatarUrl: 'https://via.placeholder.com/150',
                    //     duration: "00:48 h of 5 h",
                    //     schedule: "4-5 October",
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
                    //     schedule: "4-5 October",
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
                    //     schedule: "4-5 October",
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
                    //     schedule: "4-5 October",
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
    required TimeOfDay duration,
    required String schedule,
    required Color color,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * .64,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.symmetric(
            horizontal: BorderSide(color: color, width: .5),
            vertical: BorderSide(color: color, width: 15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .6,
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
          Row(
            children: [
              Text(
                "At ${duration.takeTimeAndHour()}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 152, 152, 152), fontSize: 12),
              ),
              Text(
                " Schedule: " + schedule,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
