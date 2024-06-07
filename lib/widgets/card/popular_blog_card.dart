import 'package:auto_route/auto_route.dart';
import 'package:blog_app/models/blog.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

final dateformatter = DateFormat();

class PopularBlogCard extends StatelessWidget {
  const PopularBlogCard({super.key, required this.blog});

  final Blog blog;

  @override
  Widget build(BuildContext context) {
    final title = blog.title;
    final subtitle = blog.content;

    final category = blog.category;
    final createdAt = DateFormat.yMMMMd().format(blog.createdAt);
    return ListTile(
      onTap: () {
        context.pushRoute(BlogDetailRoute(blog: blog));
      },
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(5),
          Text(
            category.name.toUpperCase(),
            style: TextStyle(
              color: categoryColors[category],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelSmall,
            maxLines: 3,
            overflow: TextOverflow.fade,
          ),
          const Gap(10),
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
          )
        ],
      ),
      trailing: SizedBox(
        width: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            blog.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
