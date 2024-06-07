import 'package:auto_route/auto_route.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkOnBoardStatus();
  }

  void _checkOnBoardStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? isVisit = prefs.getBool('onBoardVisit');

    if (!mounted) return;
    if (isVisit == null || !isVisit) {
      context.replaceRoute(const OnboardingRoute());
    } else {
      context.replaceRoute(const MainRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
