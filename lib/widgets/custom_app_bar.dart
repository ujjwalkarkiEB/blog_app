import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/authentication_provider.dart';
import 'package:blog_app/providers/user_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
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

  @override
  Widget build(BuildContext context) {
    final currentTime = TimeOfDay.now();
    final greeting = getGreeting(currentTime);
    final userInfo = context.watch<UserProvider>().userInfo;
    final authenticator = context.read<AuthenticationProvider>();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
      child: AppBar(
          backgroundColor: AppColor.appBackgroundColor,
          title: Consumer<UserProvider>(builder: (context, provider, child) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundImage: userInfo.profileImg.startsWith('assets/')
                      ? const AssetImage("assets/images/add/user_image.png")
                      : FileImage(File(userInfo.profileImg)) as ImageProvider,
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
                      userInfo.name.toUpperCase(),
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
            IconButton(
                onPressed: () {
                  authenticator.logoutUser(userInfo);
                  if (!userInfo.authenticatedState) {
                    context.router.pushAndPopUntil(const AuthenticationRoute(),
                        predicate: (r) => false);
                  }
                },
                icon: const Icon(Icons.logout))
          ]),
    );
  }
}
