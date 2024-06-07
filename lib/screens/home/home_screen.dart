import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/filter_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/screens/search_blogs_screen.dart';
import 'package:blog_app/widgets/card/blog_card.dart';
import 'package:blog_app/widgets/container/search_container.dart';
import 'package:blog_app/widgets/custom_app_bar.dart';
import 'package:blog_app/widgets/card/popular_blog_card.dart';
import 'package:blog_app/widgets/tiles/section_header.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var searchQuery = '';
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.95,
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SearchContainer(
                  showFilter: searchQuery.trim().isEmpty,
                  onChange: (val) {
                    setState(() {
                      searchQuery = val;
                    });
                  },
                ),
                searchQuery.trim().isEmpty
                    ? Column(
                        children: [
                          const Gap(10),
                          const SectionHeader(title: 'Latest Blogs'),
                          const Gap(10),
                          const LatestBlogsSection(),
                          const Gap(20),
                          Row(
                            children: [
                              const Flexible(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                              Text(
                                'Popular Blogs',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const Flexible(
                                child: Divider(
                                  color: Colors.black,
                                  thickness: 0.5,
                                  indent: 10,
                                  endIndent: 10,
                                ),
                              ),
                            ],
                          ),
                          const Gap(10),
                          const PopularBlogsSection()
                        ],
                      )
                    : SearchBlogsScreen(searchQuery: searchQuery),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () {
            context.router.push(const BlogCreateRoute());
          },
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}

class LatestBlogsSection extends StatelessWidget {
  const LatestBlogsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<BlogProvider, FilterProvider>(
      builder: (context, blogProvider, filterProvider, child) {
        final filters = filterProvider.activefilters;

        final blogs = blogProvider.getLatestBlogs(filters);
        return blogs.isEmpty
            ? Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Center(
                  child: Text('Not Found !'),
                ),
              )
            : SizedBox(
                height: 300,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: blogs.length,
                    separatorBuilder: (_, __) => const Gap(40),
                    itemBuilder: (ctx, index) {
                      final blog = blogs[index];
                      return BlogCard(
                        blog: blog,
                      );
                    }),
              );
      },
    );
  }
}

class PopularBlogsSection extends StatelessWidget {
  const PopularBlogsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<BlogProvider, FilterProvider>(
      builder: (context, blogProvider, filterProvider, child) {
        final filters = filterProvider.activefilters;
        final blogs = blogProvider.getPopularBlogs(filters);
        return blogs.isEmpty
            ? Container(
                height: 200,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Center(
                  child: Text('Not Found !'),
                ),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: blogs.length,
                  itemBuilder: (ctx, index) {
                    return PopularBlogCard(
                      blog: blogs[index],
                    );
                  },
                ),
              );
      },
    );
  }
}
