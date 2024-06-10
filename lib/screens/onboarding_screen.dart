import 'package:auto_route/auto_route.dart';
import 'package:blog_app/routes/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/profile_modal.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var username = '';
  void _getStarted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardVisit', true);

    if (!mounted) {
      return;
    }
    context.router.replace(const MainRoute());
  }

  void openModal() async {
    final user = await showModalBottomSheet<String>(
        context: context, builder: (ctx) => const ProfileModal());
    setState(() {
      username = user!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/json_file/onboarding.json",
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
          TextButton(
              onPressed: openModal, child: const Text('Set your profile')),
          ElevatedButton(
            onPressed: _getStarted,
            child: Text(
              'Get Started ${username.toUpperCase()}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}
