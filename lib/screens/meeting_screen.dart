import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/resources/jitsi_meet_method.dart';

import '../widgets/home_meeting_button.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);

  final JitsiMeetMethod _jitsiMeetMethod = JitsiMeetMethod();

  craateNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 100000000).toString();
    _jitsiMeetMethod.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeMeetingButton(
              onPressed: craateNewMeeting,
              text: 'New Meeting',
              icon: Icons.videocam,
            ),
            HomeMeetingButton(
              onPressed: () => joinMeeting(context),
              text: 'Join Meeting',
              icon: Icons.add_box_rounded,
            ),
            HomeMeetingButton(
                onPressed: () {}, text: 'Schedule', icon: Icons.calendar_today),
            HomeMeetingButton(
                onPressed: () {},
                text: 'Share Screen',
                icon: Icons.arrow_upward_rounded),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            'Create or Join Meeting in Just one Click!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ))
      ],
    );
  }
}
