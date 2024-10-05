import 'package:flutter/material.dart';
import 'package:task_manager/screens/manage_task.dart';
import 'package:task_manager/screens/task_overview.dart';

class TaskManagerHome extends StatefulWidget {
  @override
  _TaskManagerHomeState createState() => _TaskManagerHomeState();
}

class _TaskManagerHomeState extends State<TaskManagerHome> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    TaskOverviewScreen(),
    ManageTaskPage(), // This is the page you'll link to the calendar
    ManageTaskPage(), // This is the page you'll link to the calendar
    // Add other pages here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          // Add other navigation items here
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}