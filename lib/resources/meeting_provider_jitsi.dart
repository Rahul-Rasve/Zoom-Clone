import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone/resources/auth_provider.dart';

class MeetingProvider {
  final AuthProvider provider = AuthProvider();
  void createMeeting({
    required String roomCode,
    required bool isAudioEnabled,
    required bool isVideoEnabled,
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: roomCode)
        ..userDisplayName = provider.user.displayName
        ..userEmail = provider.user.email
        ..userAvatarURL = provider.user.photoURL
        ..audioMuted = isAudioEnabled
        ..videoMuted = isVideoEnabled;

      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
