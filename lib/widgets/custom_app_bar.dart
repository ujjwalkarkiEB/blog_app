import 'dart:convert';
import 'dart:io';

import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void getUserData() async {
    final pref = await SharedPreferences.getInstance();
    var userdata = pref.getString('userData');
    if (userdata == null) {
      return null;
    }
    final decodedUserData = jsonDecode(userdata);
    setState(() {
      userData = decodedUserData;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    final currentTime = TimeOfDay.now();
    final greeting = getGreeting(currentTime);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
      child: AppBar(
        backgroundColor: AppColor.appBackgroundColor,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage("assets/images/add/user_image.png"),
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
                  userData == null
                      ? 'Anonymous '
                      : userData!['userName'] as String,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: Colors.orange),
                )
              ],
            ),
          ],
        ),
        actions: const [Icon(Icons.notifications)],
      ),
    );
  }
}
