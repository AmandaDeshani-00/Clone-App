import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
                        radius: hasBorder ? 17.0 : 20.0,
                        backgroundColor: Colors.grey[200],
                        child: ClipOval(
                          child: HashCachedImage(
                            imageUrl: imageUrl,
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
        ),
                    isActive ? Positioned(
                      bottom: 0.0,
                      right: 0.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green : Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    : const SizedBox.shrink(),
      ],
    );
  }
}