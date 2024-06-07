import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

final dateformatter = DateFormat();

class SavedBlogCard extends StatelessWidget {
  const SavedBlogCard(
      {super.key, required this.blog, required this.showFavStatus});
  final bool showFavStatus;
  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final title = blog.title;

    final category = blog.category;
    final createdAt = DateFormat.yMMMMd().format(blog.createdAt);
    return InkWell(
      onTap: () {
        context.router.push(BlogDetailRoute(blog: blog));
      },
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name,
                    style: TextStyle(
                      color: categoryColors[category],
                    ),
                  ),
                  SizedBox(
                    width: 280,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_month),
                      const Gap(5),
                      Text(
                        createdAt,
                        style: const TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              showFavStatus
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.orange,
                      size: 30,
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
    );
  }
}
