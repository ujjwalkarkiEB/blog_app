import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/widgets/card/saved_blog_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SearchBlogsScreen extends StatelessWidget {
  const SearchBlogsScreen({super.key, required this.searchQuery});
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(10),
        Consumer<BlogProvider>(builder: (context, provider, child) {
          final blogs = provider.blogs;
          final filteredBlogs = blogs.where((blog) {
            return blog.title.toLowerCase().contains(searchQuery.toLowerCase());
          }).toList();

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ListView.separated(
                itemCount: filteredBlogs.length,
                separatorBuilder: (context, index) => const Gap(10),
                itemBuilder: (ctx, index) {
                  return SavedBlogCard(
                      blog: filteredBlogs[index], showFavStatus: false);
                }),
          );
        }),
      ],
    );
  }
}
