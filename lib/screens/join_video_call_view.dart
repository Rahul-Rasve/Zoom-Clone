// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/resources/meeting_provider_jitsi.dart';
import 'package:zoom_clone/utilities/colors.dart';
import 'package:zoom_clone/widgets/meeting_options.dart';

class VideoCallView extends StatefulWidget {
  const VideoCallView({super.key});

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  final AuthProvider provider = AuthProvider();
  final MeetingProvider meetingProvider = MeetingProvider();

  late TextEditingController meetingName;
  late TextEditingController meetingId;

  bool isAudioDisabled = true;
  bool isVideoDisabled = true;

  @override
  void initState() {
    meetingName = TextEditingController(text: provider.user.displayName);
    meetingId = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    meetingId.dispose();
    meetingName.dispose();
    JitsiMeet.removeAllListeners();
  }

  joinMeeting() {
    meetingProvider.createMeeting(
      roomCode: meetingId.text,
      isAudioDisabled: isAudioDisabled,
      isVideoDisabled: isVideoDisabled,
      userName: meetingName.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingName,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Name',
                contentPadding: EdgeInsets.only(top: 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 60.0,
            child: TextField(
              controller: meetingId,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                hintText: 'Room ID',
                contentPadding: EdgeInsets.only(top: 10.0),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          MeetingOptions(
            settingName: 'Mute my Audio',
            isMute: isAudioDisabled,
            onChanged: (value) {
              setState(() {
                isAudioDisabled = value;
              });
            },
          ),
          MeetingOptions(
            settingName: 'Turn off my Video',
            isMute: isVideoDisabled,
            onChanged: (value) {
              setState(() {
                isVideoDisabled = value;
              });
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: buttonColor,
            ),
            child: InkWell(
              onTap: joinMeeting,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
