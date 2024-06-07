import 'package:auto_route/auto_route.dart';
import 'package:blog_app/data/data.dart';
import 'package:blog_app/models/comment.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:blog_app/widgets/container/comment_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../models/blog.dart';

@RoutePage()
class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, required this.blog});
  final Blog blog;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: const Text('Comment Section'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Expanded(
              child:
                  Consumer<BlogProvider>(builder: (context, provider, child) {
                final comments = provider.getCommentsInOrder(widget.blog);
                return SizedBox(
                  child: ListView.builder(
                      itemCount: comments.length,
                      itemBuilder: (ctx, index) {
                        final cmt = comments[index];
                        return CommentContainer(comment: cmt);
                      }),
                );
              }),
            ),
            const Gap(20),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: ListTile(
                title: TextField(
                  controller: textController,
                  decoration: InputDecoration(
                    hintText: 'Comment your thoughts....',
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    final cmt = Comment(
                        content: textController.text,
                        createdAt: DateTime.now(),
                        author: 'Anonympus');
                    context.read<BlogProvider>().addComment(widget.blog, cmt);
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
