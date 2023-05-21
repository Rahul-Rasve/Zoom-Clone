import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseProvider {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;
  final FirebaseAuth authProvider = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get meetingsHistory => firebase
      .collection('users')
      .doc(authProvider.currentUser?.uid)
      .collection('meetings')
      .orderBy('time', descending: true)
      .snapshots();

  void addMeetingToFirebase(String meetingName) async {
    try {
      await firebase
          .collection('users')
          .doc(authProvider.currentUser?.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'time': DateTime.now(),
      });
    } catch (e) {
      e.toString();
    }
  }
}
