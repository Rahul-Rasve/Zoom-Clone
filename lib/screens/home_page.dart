// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zoom_clone/utilities/colors.dart';
import 'package:zoom_clone/widgets/home_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int iconIndex = 0;
  onTap(int iconData) {
    setState(() {
      iconIndex = iconData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text('Chat'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomePageButton(
                onPressed: () {},
                icon: Icons.video_call,
                text: 'New Meeting',
              ),
              HomePageButton(
                onPressed: () {},
                icon: Icons.add_box_rounded,
                text: 'Join Meeting',
              ),
              HomePageButton(
                onPressed: () {},
                icon: Icons.calendar_month_rounded,
                text: 'Schedule',
              ),
              HomePageButton(
                onPressed: () {},
                icon: Icons.arrow_upward_rounded,
                text: 'Share Screen',
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create/Join a Meeting',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(
          color: buttonColor,
        ),
        unselectedItemColor: Colors.grey,
        currentIndex: iconIndex,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
