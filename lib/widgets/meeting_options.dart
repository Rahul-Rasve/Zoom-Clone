// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:zoom_clone/utilities/colors.dart';

class MeetingOptions extends StatelessWidget {
  final String settingName;
  final bool isMute;
  final Function(bool) onChanged;
  const MeetingOptions(
      {super.key,
      required this.settingName,
      required this.isMute,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: secondaryBackgroundColor,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              settingName,
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
            Switch.adaptive(
              value: isMute,
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
