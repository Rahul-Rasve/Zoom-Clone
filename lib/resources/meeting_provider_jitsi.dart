import 'package:fluttertoast/fluttertoast.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_provider.dart';
import 'package:zoom_clone/resources/firebase_provider.dart';

class MeetingProvider {
  final AuthProvider provider = AuthProvider();
  final FirebaseProvider firebaseProvider = FirebaseProvider();

  void createMeeting({
    required String roomCode,
    required bool isAudioDisabled,
    required bool isVideoDisabled,
    String userName = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.inviteEnabled = false;
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (userName.isEmpty) {
        name = provider.user.displayName!;
      } else {
        name = userName;
      }

      var options = JitsiMeetingOptions(room: roomCode)
        ..userAvatarURL = provider.user.photoURL
        ..userDisplayName = name
        ..userEmail = provider.user.email
        ..userAvatarURL = provider.user.photoURL
        ..audioMuted = isAudioDisabled
        ..videoMuted = isVideoDisabled;

      await JitsiMeet.joinMeeting(options);

      firebaseProvider.addMeetingToFirebase(roomCode);
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Could't join the meeting",
      );
    }
  }
}
