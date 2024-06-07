import 'package:blog_app/providers/blog_provider.dart';
import 'package:blog_app/providers/filter_provider.dart';
import 'package:blog_app/routes/app_route.dart';
import 'package:blog_app/utils/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => BlogProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => FilterProvider(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appThemeData,
        title: 'Flutter Demo',
        routerConfig: AppRouter().config(),
      ),
    );
  }
}
