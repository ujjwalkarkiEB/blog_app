import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeNavigationScreen extends StatelessWidget {
  const HomeNavigationScreen({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      key: navigatorKey,
    );
  }
}
