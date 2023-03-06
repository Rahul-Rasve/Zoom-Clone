// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:jitsi_meet_fix/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/resources/meeting_provider_jitsi.dart';
import 'package:zoom_clone/utilities/colors.dart';
import 'package:zoom_clone/widgets/input_field.dart';
import 'package:zoom_clone/widgets/meeting_options.dart';
import 'package:zoom_clone/widgets/round_button.dart';

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
    return SafeArea(
      child: Scaffold(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              InputField(
                controller: meetingName,
                hintText: 'Name',
                inputType: TextInputType.text,
              ),
              InputField(
                controller: meetingId,
                hintText: 'Room Code',
                inputType: TextInputType.number,
              ),
              SizedBox(
                height: 30.0,
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
                height: 30.0,
              ),
              RoundButton(
                text: 'Join Meeting',
                onPressed: joinMeeting,
              )
            ],
          ),
        ),
      ),
    );
  }
}
