import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List <User> onlineUsers;

  const Rooms({
    Key? key, 
    required this.onlineUsers,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers[index - 1];
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ProfileAvatar(
            imageUrl: user.imageUrl, 
            isActive: true),

          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => print('Create Room'),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: const BorderSide(
          width: 3.0,
          color: Colors.blueAccent,
        ),
        foregroundColor: Palette.facebookBlue, // text/icon color
        backgroundColor: Colors.white,
      ),
      child: Row(
        children: [
                ShaderMask(
          shaderCallback: (rect) => Palette.createRoomGradient.createShader(rect),
          child: Icon(
           Icons.video_call,
            size: 35.0,
            color: Colors.white,
          ),
        ),
          const SizedBox(width: 4.0),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
