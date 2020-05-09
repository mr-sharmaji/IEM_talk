import 'package:flutter/material.dart';
import 'package:iem_talk/widgets/custom_image.dart';
import 'package:iem_talk/widgets/post.dart';
import 'package:cached_network_image/cached_network_image.dart';
class PostTile extends StatelessWidget {
  final Post post;

  PostTile(this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('showing post'),
      child: cachedNetworkImage(post.mediaUrl),
    );
  }
}