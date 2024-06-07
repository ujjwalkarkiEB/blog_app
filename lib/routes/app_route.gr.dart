// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:blog_app/models/blog.dart' as _i13;
import 'package:blog_app/screens/blog/blog_create.dart' as _i1;
import 'package:blog_app/screens/blog/blog_detail.dart' as _i2;
import 'package:blog_app/screens/blog/comment_screen.dart' as _i3;
import 'package:blog_app/screens/home/home_navigation.dart' as _i4;
import 'package:blog_app/screens/home/home_screen.dart' as _i5;
import 'package:blog_app/screens/main_screen.dart' as _i6;
import 'package:blog_app/screens/onboarding_screen.dart' as _i7;
import 'package:blog_app/screens/profile/profile_screen.dart' as _i8;
import 'package:blog_app/screens/saved/saved_screen.dart' as _i9;
import 'package:blog_app/screens/splash_screen.dart' as _i10;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    BlogCreateRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BlogCreateScreen(),
      );
    },
    BlogDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BlogDetailRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BlogDetailScreen(
          key: args.key,
          blog: args.blog,
        ),
      );
    },
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CommentScreen(
          key: args.key,
          blog: args.blog,
        ),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      final args = routeData.argsAs<HomeNavigationRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.HomeNavigationScreen(
          key: args.key,
          navigatorKey: args.navigatorKey,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.OnboardingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ProfileScreen(),
      );
    },
    SavedRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SavedScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.BlogCreateScreen]
class BlogCreateRoute extends _i11.PageRouteInfo<void> {
  const BlogCreateRoute({List<_i11.PageRouteInfo>? children})
      : super(
          BlogCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogCreateRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BlogDetailScreen]
class BlogDetailRoute extends _i11.PageRouteInfo<BlogDetailRouteArgs> {
  BlogDetailRoute({
    _i12.Key? key,
    required _i13.Blog blog,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          BlogDetailRoute.name,
          args: BlogDetailRouteArgs(
            key: key,
            blog: blog,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogDetailRoute';

  static const _i11.PageInfo<BlogDetailRouteArgs> page =
      _i11.PageInfo<BlogDetailRouteArgs>(name);
}

class BlogDetailRouteArgs {
  const BlogDetailRouteArgs({
    this.key,
    required this.blog,
  });

  final _i12.Key? key;

  final _i13.Blog blog;

  @override
  String toString() {
    return 'BlogDetailRouteArgs{key: $key, blog: $blog}';
  }
}

/// generated route for
/// [_i3.CommentScreen]
class CommentRoute extends _i11.PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    _i12.Key? key,
    required _i13.Blog blog,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            key: key,
            blog: blog,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentRoute';

  static const _i11.PageInfo<CommentRouteArgs> page =
      _i11.PageInfo<CommentRouteArgs>(name);
}

class CommentRouteArgs {
  const CommentRouteArgs({
    this.key,
    required this.blog,
  });

  final _i12.Key? key;

  final _i13.Blog blog;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, blog: $blog}';
  }
}

/// generated route for
/// [_i4.HomeNavigationScreen]
class HomeNavigationRoute extends _i11.PageRouteInfo<HomeNavigationRouteArgs> {
  HomeNavigationRoute({
    _i12.Key? key,
    required _i12.GlobalKey<_i12.NavigatorState> navigatorKey,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HomeNavigationRoute.name,
          args: HomeNavigationRouteArgs(
            key: key,
            navigatorKey: navigatorKey,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const _i11.PageInfo<HomeNavigationRouteArgs> page =
      _i11.PageInfo<HomeNavigationRouteArgs>(name);
}

class HomeNavigationRouteArgs {
  const HomeNavigationRouteArgs({
    this.key,
    required this.navigatorKey,
  });

  final _i12.Key? key;

  final _i12.GlobalKey<_i12.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'HomeNavigationRouteArgs{key: $key, navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OnboardingScreen]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SavedScreen]
class SavedRoute extends _i11.PageRouteInfo<void> {
  const SavedRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SavedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
