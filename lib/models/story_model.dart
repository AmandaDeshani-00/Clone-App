import 'package:facebook_clone/models/user_model.dart';


class Story {
  final User user;
  final bool isViewed;
  final String imageUrl;

  const Story({
    required this.user,
    this.isViewed = false,
    required this.imageUrl,
    });
}