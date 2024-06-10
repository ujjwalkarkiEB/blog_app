import 'dart:io';

import 'package:blog_app/modal/profile_modal.dart';
import 'package:blog_app/providers/user_provider.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  Map<String, dynamic>? userData;
  String getGreeting(TimeOfDay currentTime) {
    final hour = currentTime.hour;
    if (hour < 12) {
      return 'Good morning!';
    } else if (hour < 17) {
      return 'Good afternoon!';
    } else {
      return 'Good evening!';
    }
  }

  void openModal() async {
    await showModalBottomSheet<String>(
        context: context, builder: (ctx) => const ProfileModal());
  }

  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.now();
    final greeting = getGreeting(currentTime);
    final userData = context.watch<UserProvider>().userData;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
      child: AppBar(
          backgroundColor: AppColor.appBackgroundColor,
          title: Consumer<UserProvider>(builder: (context, provider, child) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundImage: userData['image']!.startsWith('assets/')
                      ? const AssetImage("assets/images/add/user_image.png")
                      : FileImage(File(userData['image'] as String))
                          as ImageProvider,
                ),
                const Gap(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greeting,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      userData['userName'].toString().toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: Colors.orange),
                    )
                  ],
                ),
              ],
            );
          }),
          actions: [
            IconButton(onPressed: openModal, icon: const Icon(Icons.edit))
          ]),
    );
  }
}
