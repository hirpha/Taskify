import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/bloc/task_state.dart';

import '../screens/success_dialog.dart';

class TaskCategoryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskBloc, TaskState>(
      listener: (context, state) {
        if (state is TaskLoaded) {
          if (state.tasks.where((task) => task.status).toList().length /
                  state.tasks.length ==
              1) {
            if (ModalRoute.of(context)?.isCurrent ?? false) {
              showDialog(
                context: context,
                builder: (context) => const SuccessDialog(
                  desc:
                      "All tasks for today are complete. Keep up the great work!",
                  title: "Well Done! 🎉",
                  isPopTwo: false,
                ),
              );
            }
          }
        }
      },
      builder: (context, state) {
        if (state is TaskLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Personal',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            ...state.tasks
                                .where((t) => t.workspace == "Personal")
                                .toList()
                                .map((task) => Column(
                                      children: [
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 20,
                                              padding: const EdgeInsets.all(0),
                                              decoration: const BoxDecoration(
                                                  color: Colors.black,
                                                  shape: BoxShape.circle),
                                              child: Icon(
                                                  task.status
                                                      ? Icons
                                                          .check_circle_outline
                                                      : Icons.circle_outlined,
                                                  size: 15,
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Flexible(
                                              child: Text(
                                                task.title,
                                                softWrap: true,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  decoration: task.status
                                                      ? TextDecoration
                                                          .lineThrough
                                                      : null,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                  decorationColor: Colors.black,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 103, 103, 103)
                                .withOpacity(.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Daily Task",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${state.tasks.where((task) => task.status).toList().length}/${state.tasks.length} done ",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            CircularPercentIndicator(
                              radius: 25.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: state.tasks
                                      .where((task) => task.status)
                                      .toList()
                                      .length /
                                  state.tasks.length,
                              center: Text(
                                "${((state.tasks.where((task) => task.status).toList().length / state.tasks.length) * 100).toStringAsFixed(0)}%",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 231, 77, 12),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'General',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        ...state.tasks
                            .where((t) => t.workspace == "General")
                            .toList()
                            .map((task) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          padding: const EdgeInsets.all(0),
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                              task.status
                                                  ? Icons.check_circle_outline
                                                  : Icons.circle_outlined,
                                              size: 15,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            task.title,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 13,
                                              decoration: task.status
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              decorationStyle:
                                                  TextDecorationStyle.solid,
                                              decorationColor: Colors.black,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                        const Text(
                          'Office',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        ...state.tasks
                            .where((t) => t.workspace == "Office")
                            .toList()
                            .map((task) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          alignment: Alignment.center,
                                          // padding: const EdgeInsets.all(5),
                                          decoration: const BoxDecoration(
                                              color: Colors.black,
                                              shape: BoxShape.circle),
                                          child: Icon(
                                              task.status
                                                  ? Icons.check_circle_outline
                                                  : Icons.circle_outlined,
                                              size: 15,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          child: Text(
                                            task.title,
                                            softWrap: true,
                                            style: TextStyle(
                                              fontSize: 13,
                                              decoration: task.status
                                                  ? TextDecoration.lineThrough
                                                  : null,
                                              decorationStyle:
                                                  TextDecorationStyle.solid,
                                              decorationColor: Colors.black,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
