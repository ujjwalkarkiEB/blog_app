import 'package:auto_route/auto_route.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:blog_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<NavigatorState> homeNavKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeNavigationRoute(navigatorKey: homeNavKey),
        const SavedRoute(),
        const ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 14,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) {
            if (tabsRouter.activeIndex != index) {
              if (tabsRouter.activeIndex == 0) {
                homeNavKey.currentState?.popUntil((router) => router.isFirst);
              }
              tabsRouter.setActiveIndex(index);
            }
          },
          selectedIconTheme: const IconThemeData(color: AppColor.buttonColor),
          selectedItemColor: AppColor.buttonColor,
          iconSize: 25,
          items: const [
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: 'Saved', icon: Icon(Icons.favorite_outlined)),
            BottomNavigationBarItem(
                label: 'Profile', icon: Icon(Icons.supervised_user_circle)),
          ],
        );
      },
    );
  }
}
