import 'package:auto_route/auto_route.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  void _getStarted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardVisit', true);
    if (!mounted) {
      return;
    }
    context.router.replace(const MainRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/lottie/gif/onboard.gif",
            scale: 1,
            height: 300,
            width: 300,
            fit: BoxFit.cover,
          ),
          const Gap(10),
          Text(
            'Get The Latest And Updated',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Articles Easily With Us',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Gap(8),
          const Text('Get the latest articles and updates everyday and'),
          const Text('add your trusted knowledge with us'),
          const Gap(15),
          ElevatedButton(
            onPressed: _getStarted,
            child: const Text('Get Started'),
          ),
        ],
      ),
    ));
  }
}
