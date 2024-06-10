import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:blog_app/providers/user_provider.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void getUserData() async {
    final pref = await SharedPreferences.getInstance();
    var userdata = pref.getString('userData');
    if (userdata == null) {
      return null;
    }
    final Map<String, dynamic> decodedUserData = jsonDecode(userdata);
    if (!mounted) {
      return;
    }
    context.read<UserProvider>().setUserData(decodedUserData);
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeNavigationRoute(),
        SavedRoute(),
        YourBlogListRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          elevation: 14,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            // if (tabsRouter.activeIndex != index) {
            //   if (tabsRouter.activeIndex == 0) {
            //     tabsRouter.stack.first;
            //   }
            tabsRouter.setActiveIndex(index);
            // }
          },
          selectedIconTheme: const IconThemeData(color: AppColor.buttonColor),
          selectedItemColor: AppColor.buttonColor,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Saved', icon: Icon(Icons.favorite_outlined)),
            BottomNavigationBarItem(
                label: 'Your Blogs', icon: Icon(Iconsax.user_octagon4)),
          ],
        );
      },
    );
  }
}
