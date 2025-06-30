import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _PostHeader(post: post),
                      const SizedBox(height: 4.0),
                      Text(post.caption),
                      post.imageUrl != null
                          ? const SizedBox.shrink()
                          : const SizedBox(height: 6.0),
                    ],
                  ),
                ),
                post.imageUrl != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: HashCachedImage(imageUrl: post.imageUrl!),
                      )
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: _PostStats(post: post),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text('${post.timeAgo} • ',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 12.0,
                      )),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print('More'),
        ),
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  const _PostStats({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: const BoxDecoration(
              color: Palette.facebookBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.thumb_up,
              size: 10.0,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: Text(
              '${post.likes}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ),
          Text(
            '${post.comments} Comments',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            '${post.shares} Shares',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      const Divider(),
      Row(
        children: [
          _PostButton(
            icon: Icons.thumb_up_outlined,
            label: 'Like',
            onTap: () => print('Like'),
          ),
          _PostButton(
            icon: Icons.comment_outlined,
            label: 'Comment',
            onTap: () => print('Comment'),
          ),
         _PostButton(
  icon: FontAwesomeIcons.share,
  label: 'Share',
  onTap: () => print('Share'),
)
        ],
      )
    ]
    );
  }
}

class _PostButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onTap;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 20.0, color: Colors.grey[600]),
                const SizedBox(width: 4.0),
                Text(label, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          )
        ),
      ),
    );
  }
}
