import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:blog_app/widgets/card/saved_blog_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Text(
          'Your SaveList',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Consumer<BlogProvider>(builder: (context, provider, child) {
        final savelist = provider.savedBlogs;
        if (savelist.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/add/emptylist.png",
                  height: 200,
                  width: 200,
                ),
                RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: 'Empty!', style: TextStyle(color: Colors.orange)),
                  TextSpan(
                      text: '  Make Your Habit To Read Articles',
                      style: TextStyle(color: Colors.black38))
                ]))
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: ListView.builder(
              itemCount: savelist.length,
              itemBuilder: (ctx, index) {
                return SavedBlogCard(
                    blog: savelist[index], showFavStatus: true);
              }),
        );
      }),
    );
  }
}
