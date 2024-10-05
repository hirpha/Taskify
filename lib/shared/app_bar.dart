import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leadingWidth: MediaQuery.of(context).size.width * .2,
      leading: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            shape: BoxShape.circle, color: Color.fromARGB(182, 255, 255, 255)),
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'), // Replace with your profile image
        ),
      ),
      centerTitle: true,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good Morning ☁️',
              style: TextStyle(color: Colors.grey, fontSize: 14)),
          Text('Michael Drogba',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ],
      ),
      actions: [
        Container(
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(117, 249, 249, 249)),
          child: Container(
            padding: EdgeInsets.all(3),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined,
                  color: Color.fromARGB(255, 0, 0, 0)),
              onPressed: () {},
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
