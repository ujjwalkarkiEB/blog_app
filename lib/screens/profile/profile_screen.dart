import 'package:auto_route/auto_route.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListTile(
              title: const Text('Ujjwal Karki'),
              subtitle: const Text('ujwal.bdev@gmail.com'),
              leading: const CircleAvatar(radius: 25),
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            ),
          ],
        ),
      ),
    );
  }
}
