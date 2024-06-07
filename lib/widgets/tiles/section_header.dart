import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key, required this.title, this.isViewAll = false});
  final String title;
  final bool isViewAll;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: TextButton(
          onPressed: () {
            // context.router.push(const AllBlogsRoute());
          },
          child: Text(isViewAll ? 'View All Blogs' : '')),
    );
  }
}
