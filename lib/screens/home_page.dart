// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/screens/meeting_history_view.dart';
import 'package:zoom_clone/screens/meeting_view.dart';
import 'package:zoom_clone/utilities/colors.dart';
import 'package:zoom_clone/widgets/round_button.dart';

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

  List<Widget> views = [
    MeetingView(),
    HistoryMeetingView(),
    // Text('Contacts'),
    RoundButton(
      text: 'Logout',
      onPressed: () => AuthProvider().signOut(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text('Zoom Clone'),
      ),
      body: views[iconIndex],
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
              Icons.video_chat,
            ),
            label: 'Meet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.logout_outlined,
            ),
            label: 'Logout',
          ),
        ],
      ),
    );
  }
}
