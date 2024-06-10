import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/user_provider.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:blog_app/widgets/card/saved_blog_card.dart';
import 'package:blog_app/widgets/text/empty_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

@RoutePage()
class YourBlogListScreen extends StatelessWidget {
  const YourBlogListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Blogs '),
        backgroundColor: AppColor.appBackgroundColor,
      ),
      body: Consumer2<BlogProvider, UserProvider>(
          builder: (context, blog, user, child) {
        final author = user.userData['userName'];

        final blogs = blog.getAuthorBlogList(author!);
        if (blogs.isEmpty) {
          return const Center(
              child: EmptyText(title: 'Currently You haveno blogs yet!'));
        }
        return Padding(
            padding: const EdgeInsets.all(14),
            child: ListView.separated(
                itemCount: blogs.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (ctx, index) {
                  return Dismissible(
                    key: ValueKey(blogs[index].title),
                    child:
                        SavedBlogCard(blog: blogs[index], showFavStatus: false),
                    onDismissed: (direction) {
                      blog.deleteBlog(blogs[index], author);
                    },
                  );
                }));
      }),
    );
  }
}
