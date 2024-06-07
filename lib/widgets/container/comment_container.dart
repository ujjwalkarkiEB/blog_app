import 'package:blog_app/models/comment.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class CommentContainer extends StatelessWidget {
  const CommentContainer({super.key, required this.comment});
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final commentDate = DateFormat().add_yMMMd().format(comment.createdAt);
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
                backgroundImage:
                    AssetImage('assets/images/add/user_image.png')),
            title: Text(comment.author ?? 'Anonymous'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(commentDate),
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
