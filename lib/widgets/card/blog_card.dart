import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/utils/helpers/post_date.dart';
import 'package:blog_app/widgets/container/category_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BlogCard extends StatelessWidget {
  const BlogCard({
    super.key,
    required this.blog,
  });

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final title = blog.title;
    final subtitle = blog.content;
    final comments = blog.coments.length;
    final category = blog.category;

    return InkWell(
      onTap: () {
        context.router.push(BlogDetailRoute(blog: blog));
      },
      child: Container(
        width: 280,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                offset: const Offset(4, 4),
                blurRadius: 16,
              )
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ------image/category---
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((20)),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Hero(
                      tag: blog.title,
                      child: blog.image.startsWith('assets/')
                          ? Image.asset(
                              blog.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : Image.file(
                              File(blog.image),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 15,
                    child: CategoryContainer(
                      category: category,
                      isActive: false,
                    ),
                  )
                ],
              ),
            ),
            // ----- attributes ------
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 2,
                    ),
                    const Spacer(),
                    Text(
                      subtitle,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.history,
                              color: Colors.orange,
                            ),
                            const Gap(5),
                            Text(
                              PostDateHelper()
                                  .postTimeExtracter(blog.createdAt),
                              style: const TextStyle(
                                  color: Colors.orange, fontSize: 10),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.comment,
                              color: Colors.orange,
                            ),
                            Text(
                              '  ${comments.toString()}',
                              style: const TextStyle(
                                  color: Colors.orange, fontSize: 10),
                            ),
                            const Text(
                              ' comments ',
                              style: TextStyle(color: Colors.orange),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
