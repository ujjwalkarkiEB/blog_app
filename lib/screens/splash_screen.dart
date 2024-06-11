import 'package:auto_route/auto_route.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    if (isVisit == null || !isVisit) {
      context.replaceRoute(const OnboardingRoute());
    } else {
      context.replaceRoute(const AuthenticationRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/json_file/loading.json"),
      ),
    );
  }
}
