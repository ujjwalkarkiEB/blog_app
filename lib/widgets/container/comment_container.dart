import 'dart:io';

import 'package:blog_app/models/comment.dart';
import 'package:blog_app/utils/helpers/post_date.dart';
import 'package:flutter/material.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: comment.userImg.startsWith('assets/')
                  ? AssetImage(comment.userImg)
                  : FileImage(File(comment.userImg)),
            ),
            title: Text(comment.author),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(PostDateHelper().postTimeExtracter(comment.createdAt)),
                Text(comment.content),
              ],
            ),
            trailing: const Icon(Icons.comment_bank),
          )
        ],
      ),
    );
  }
}
