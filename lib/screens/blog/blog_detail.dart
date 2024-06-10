import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:blog_app/utils/helpers/post_date.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

@RoutePage()
class BlogDetailScreen extends StatefulWidget {
  const BlogDetailScreen({super.key, required this.blog});
  final Blog blog;

  @override
  State<BlogDetailScreen> createState() => _BlogDetailScreenState();
}

class _BlogDetailScreenState extends State<BlogDetailScreen> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final blog = widget.blog;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        actions: [
          Consumer<BlogProvider>(builder: (context, provider, child) {
            return IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      content: Text(
                        blog.saved
                            ? 'Removed From You Savelist!'
                            : 'Saved to your list',
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: blog.saved ? Colors.red : Colors.green,
                    ),
                  );

                  provider.toggleSavedBlog(blog);

                  Timer(const Duration(seconds: 4), () {
                    context.router.pushAndPopUntil(const SavedRoute(),
                        predicate: (route) => false);
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: blog.saved ? Colors.orange : Colors.grey,
                ));
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ----category---
                Text(
                  blog.category.name.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: categoryColors[blog.category],
                      ),
                ),
                // ------title-----
                SizedBox(
                  width: width * 0.8,
                  child: Text(
                    blog.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),

                // ---author--
                ListTile(
                  title: Text.rich(
                      style: const TextStyle(color: Colors.orange),
                      TextSpan(text: 'By ', children: [
                        TextSpan(text: blog.author),
                      ])),
                  leading: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/add/user_image.png'),
                  ),
                  trailing: Text(
                    PostDateHelper().postTimeExtracter(blog.createdAt),
                    style: Theme.of(context).textTheme.labelSmall!.apply(
                          color: Colors.grey,
                        ),
                  ),
                ),
                // ---- blog image ---
                Card(
                  elevation: 14,
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Hero(
                    tag: blog.title,
                    child: blog.image.startsWith('assets/')
                        ? Image.asset(
                            blog.image,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(blog.image),
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                  ),
                ),
                const Gap(10),
                // ------ content ---
                Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Scrollbar(
                        radius: const Radius.circular(20),
                        thickness: 10,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Text(blog.content),
                        ),
                      )),
                ),
                // ---- comment ----
                Consumer<BlogProvider>(builder: (context, provider, child) {
                  return ListTile(
                    leading: Text(
                      'Commenst (${blog.coments.length})',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          context.router.push(CommentRoute(blog: blog));
                        },
                        icon: const Icon(Iconsax.menu_1)),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
