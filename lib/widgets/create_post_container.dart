import 'package:facebook_clone/models/models.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
                             ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  decoration: 
                    InputDecoration.collapsed(hintText: 'What\'s on your mind?'),
                  ),
                ),
            ],
              ),
              const Divider(height: 10.0, thickness: 0.5),
              Container(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      onPressed: () => print('Live'),
                      icon: Icon(
                        Icons.videocam,
                        color: Colors.red,
                      ),
                      label: Text('Live'),
                    ),
                    const VerticalDivider(width: 8.0),
                    TextButton.icon(
                      onPressed: () => print('Photo'),
                      icon: Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: Text('Photo'),
                    ),
                    const VerticalDivider(width: 8.0),
                    TextButton.icon(
                      onPressed: () => print('Room'),
                      icon: Icon(
                        Icons.video_call,
                        color: Colors.purpleAccent,
                      ),
                      label: Text('Room'),
                    )
                  ],
                ),
              )
            ],
      ),
    );
  }
}