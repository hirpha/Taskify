import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  static const String routeName = "newtask";
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  DateTime _dueDate = DateTime.now();
  DateTime _endDate = DateTime.now();
  TimeOfDay _dailyTime = TimeOfDay(hour: 10, minute: 0);
  String _selectedWorkspace = 'Select workspace';
  List<String> workspaces = ['Workspace 1', 'Workspace 2', 'Workspace 3'];

  Future<void> _selectDate(BuildContext context, bool isDueDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isDueDate ? _dueDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _dueDate)
      setState(() {
        if (isDueDate) {
          _dueDate = picked;
        } else {
          _endDate = picked;
        }
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _dailyTime,
    );
    if (picked != null && picked != _dailyTime)
      setState(() {
        _dailyTime = picked;
      });
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
                icon:
                    const Icon(Icons.menu, color: Color.fromARGB(255, 0, 0, 0)),
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
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  hintText: "Please write your title here...",
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(50))),
            ),
            SizedBox(height: 10),

            const CustomText(title: "Description"),
            TextField(
              maxLines: 4,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Please write your description here...",
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)),
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[900],
              ),
            ),
            SizedBox(height: 20),

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
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "${_dueDate.toLocal()}".split(' ')[0],
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(title: "End Date"),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today, color: Colors.white),
                              SizedBox(width: 5),
                              Text(
                                "${_endDate.toLocal()}".split(' ')[0],
                                style: TextStyle(color: Colors.white),
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
            SizedBox(height: 20),
            const CustomText(title: "Daily Timeline Date"),
            GestureDetector(
              onTap: () => _selectTime(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    Icon(Icons.access_time, color: Colors.white),
                    SizedBox(width: 5),
                    Text(
                      "${_dailyTime.format(context)}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // DropdownButton<String>(
            //   value: _selectedWorkspace,
            //   dropdownColor: Colors.black,
            //   icon: Icon(Icons.arrow_drop_down, color: Colors.white),
            //   items: workspaces.map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value, style: TextStyle(color: Colors.white)),
            //     );
            //   }).toList(),
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedWorkspace = newValue?.toString() ?? "";
            //     });
            //   },
            // ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Handle create task action
              },
              child: Text('Create'),
            ),
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
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
