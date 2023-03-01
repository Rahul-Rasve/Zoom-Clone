// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_clone/resources/firebase_provider.dart';

class HistoryMeetingView extends StatelessWidget {
  const HistoryMeetingView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseProvider().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'Room Code: ${(snapshot.data! as dynamic).docs[index]['meetingName']}',
            ),
            subtitle: Text(
              'Created on: ${DateFormat.yMMMd().format(
                (snapshot.data! as dynamic).docs[index]['time'].toDate(),
              )}',
            ),
          ),
        );
      },
    );
  }
}
