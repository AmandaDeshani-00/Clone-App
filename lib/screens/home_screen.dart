import 'package:facebook_clone/config/palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/widgets/circle_btn.dart';
import 'package:facebook_clone/widgets/create_post_container.dart';
import 'package:facebook_clone/widgets/post_container.dart';
import 'package:facebook_clone/widgets/rooms.dart';
import 'package:facebook_clone/widgets/stories.dart';
import 'package:facebook_clone/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:  _HomeScreenMobile(),
          desktop: _HomeScreenDesktop(),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'facebook',
                  style: const TextStyle(
                    color: Palette.facebookBlue,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1.2,
                  ),
                ),
                centerTitle: false,
                floating: true,
                actions: [
                  CircleButton(
                    key: Key('Search'),
                    icon: Icons.search,
                    iconSize: 30.0,
                    onPressed: () => print('Search'),
                  ),
                  CircleButton(
                    key: Key('Messenger'),
                    icon: MdiIcons.facebookMessenger,
                    iconSize: 30.0,
                    onPressed: () => print('Messenger'),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: CreatePostContainer(currentUser: currentUser),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Rooms(onlineUsers: onlineUsers),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              }, childCount: posts.length))
            ],
          );
  }
}

class _HomeScreenDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        ),
        Container(
          width: 600.0,
          color: Colors.white,
        ),
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}