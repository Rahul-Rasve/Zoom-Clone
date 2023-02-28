// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/meeting_provider_jitsi.dart';

import '../widgets/home_buttons.dart';

class MeetingView extends StatelessWidget {
  MeetingView({super.key});

  final MeetingProvider meetingProvider = MeetingProvider();

  cresteNewMeeting() async {
    var random = Random();
    //generate 5 digit random number
    String roomCode = (random.nextInt(100000) + 100000).toString();
    //adding 100000 to make it 5 digit, since random generates a num between 1 and 100000
    meetingProvider.createMeeting(
        roomCode: roomCode, isAudioDisabled: true, isVideoDisabled: true);
  }

  joinMeeting(BuildContext context) async {
    Navigator.pushNamed(context, '/videoCall');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomePageButton(
              onPressed: cresteNewMeeting,
              icon: Icons.video_call,
              text: 'New Meeting',
            ),
            HomePageButton(
              onPressed: () => joinMeeting(context),
              icon: Icons.add_box_rounded,
              text: 'Join Meeting',
            ),
            // HomePageButton(
            //   onPressed: () {},
            //   icon: Icons.calendar_month_rounded,
            //   text: 'Schedule',
            // ),
            // HomePageButton(
            //   onPressed: () {},
            //   icon: Icons.arrow_upward_rounded,
            //   text: 'Share Screen',
            // ),
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
    );
  }
}
