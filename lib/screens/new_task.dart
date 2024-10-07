import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/bloc/task_bloc.dart';
import 'package:task_manager/model/task.dart';

import '../bloc/task_event.dart';

class NewTask extends StatefulWidget {
  static const String routeName = "newtask";
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  DateTime _dueDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  TextEditingController titleEditingController = TextEditingController();
  TextEditingController descEditingController = TextEditingController();
  TextEditingController workspaceEditingController = TextEditingController();
  TimeOfDay _dailyTime = const TimeOfDay(hour: 10, minute: 0);
  List<String> workspaces = ['Personal', 'General', 'Office'];



  Future<void> _selectDate(BuildContext context, bool isDueDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDueDate ? _dueDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _dueDate) {
      setState(() {
        if (isDueDate) {
          _dueDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _dailyTime,
    );
    if (picked != null && picked != _dailyTime)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        _dailyTime = picked;
      });
    print(_dailyTime.hour);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 199, 199, 199),
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
        title: const Text('New Task',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const CustomText(title: "Title"),
            TextField(
              style: const TextStyle(color: Colors.white),
              controller: titleEditingController,
              decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  hintText: "Please write your title here...",
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
            const SizedBox(height: 10),
            const CustomText(title: "Description"),
            TextField(
              controller: descEditingController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Please write your description here...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                labelStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(title: "Due Date"),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              const SizedBox(width: 5),
                              Text(
                                "${_dueDate.toLocal()}".split(' ')[0],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(title: "End Date"),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.calendar_today,
                                  color: Colors.white),
                              const SizedBox(width: 5),
                              Text(
                                "${_endDate.toLocal()}".split(' ')[0],
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const CustomText(title: "Daily Timeline Date"),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20),
                    const Icon(Icons.access_time, color: Colors.white),
                    const SizedBox(width: 5),
                    Text(
                      "${_dailyTime.format(context)}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CustomText(title: "Workspace"),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: CustomDropdown(
                onChanged: (p0) =>
                    {workspaceEditingController.text = p0.toString()},
                // controller: genderController,
                hintText: "Select workspace",

                decoration: CustomDropdownDecoration(
                  closedFillColor: Colors.grey[900],
                ),

                validator: (p0) {
                  // if (p0 == null) {
                  //   return localizations!
                  //       .translate("select_gender_error");
                  // }
                  // return null;
                },
                items: workspaces,
              ),
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: const Size(double.infinity, 60),
                ),
                onPressed: () {
                  // Handle create task action

                  Task newTask = Task(
                      title: titleEditingController.text,
                      description: descEditingController.text,
                      dueDate: _dueDate,
                      endDate: _endDate,
                      dailyTime: _dailyTime,
                      workspace: workspaceEditingController.text,
                      order: _dailyTime.hour == 0 ? 24 : _dailyTime.hour,
                      status: false);

                  BlocProvider.of<TaskBloc>(context).add(AddTask(newTask));
                },
                child: const Text(
                  'Create',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
