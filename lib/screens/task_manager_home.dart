import 'package:flutter/material.dart';
import 'package:task_manager/screens/manage_task.dart';
import 'package:task_manager/screens/new_task.dart';
import 'package:task_manager/screens/task_overview.dart';

class TaskManagerHome extends StatefulWidget {
  @override
  _TaskManagerHomeState createState() => _TaskManagerHomeState();
}

class _TaskManagerHomeState extends State<TaskManagerHome> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    TaskOverviewScreen(),
    ManageTaskPage(), // This is the page you'll link to the calendar
    TaskOverviewScreen(), // This is the page you'll link to the calendar
    TaskOverviewScreen(), // This is the page you'll link to the calendar
    TaskOverviewScreen(), // This is the page you'll link to the calendar
    // Add other pages here
  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, ManageTaskPage.routeName);
    } else if (index == 2) {
      Navigator.pushNamed(context, NewTask.routeName);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
      
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Task',
          ),
          // Add other navigation items here
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
