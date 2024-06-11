// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:blog_app/models/blog.dart' as _i15;
import 'package:blog_app/models/user.dart' as _i16;
import 'package:blog_app/screens/authentication_screen.dart' as _i1;
import 'package:blog_app/screens/blog/blog_create.dart' as _i2;
import 'package:blog_app/screens/blog/blog_detail.dart' as _i3;
import 'package:blog_app/screens/blog/comment_screen.dart' as _i4;
import 'package:blog_app/screens/blog/your_blog_list.dart' as _i12;
import 'package:blog_app/screens/home/home_navigation.dart' as _i5;
import 'package:blog_app/screens/home/home_screen.dart' as _i6;
import 'package:blog_app/screens/main_screen.dart' as _i7;
import 'package:blog_app/screens/onboarding_screen.dart' as _i8;
import 'package:blog_app/screens/profile/profile_screen.dart' as _i9;
import 'package:blog_app/screens/saved/saved_screen.dart' as _i10;
import 'package:blog_app/screens/splash_screen.dart' as _i11;
import 'package:flutter/material.dart' as _i14;

abstract class $AppRouter extends _i13.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthenticationScreen(),
      );
    },
    BlogCreateRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BlogCreateScreen(),
      );
    },
    BlogDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BlogDetailRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BlogDetailScreen(
          key: args.key,
          blog: args.blog,
        ),
      );
    },
    CommentRoute.name: (routeData) {
      final args = routeData.argsAs<CommentRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CommentScreen(
          key: args.key,
          blog: args.blog,
        ),
      );
    },
    HomeNavigationRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeNavigationScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
    MainRoute.name: (routeData) {
      final args = routeData.argsAs<MainRouteArgs>();
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MainScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.OnboardingScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ProfileScreen(),
      );
    },
    SavedRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.SavedScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.SplashScreen(),
      );
    },
    YourBlogListRoute.name: (routeData) {
      return _i13.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.YourBlogListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthenticationScreen]
class AuthenticationRoute extends _i13.PageRouteInfo<void> {
  const AuthenticationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BlogCreateScreen]
class BlogCreateRoute extends _i13.PageRouteInfo<void> {
  const BlogCreateRoute({List<_i13.PageRouteInfo>? children})
      : super(
          BlogCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'BlogCreateRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i3.BlogDetailScreen]
class BlogDetailRoute extends _i13.PageRouteInfo<BlogDetailRouteArgs> {
  BlogDetailRoute({
    _i14.Key? key,
    required _i15.Blog blog,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          BlogDetailRoute.name,
          args: BlogDetailRouteArgs(
            key: key,
            blog: blog,
          ),
          initialChildren: children,
        );

  static const String name = 'BlogDetailRoute';

  static const _i13.PageInfo<BlogDetailRouteArgs> page =
      _i13.PageInfo<BlogDetailRouteArgs>(name);
}

class BlogDetailRouteArgs {
  const BlogDetailRouteArgs({
    this.key,
    required this.blog,
  });

  final _i14.Key? key;

  final _i15.Blog blog;

  @override
  String toString() {
    return 'BlogDetailRouteArgs{key: $key, blog: $blog}';
  }
}

/// generated route for
/// [_i4.CommentScreen]
class CommentRoute extends _i13.PageRouteInfo<CommentRouteArgs> {
  CommentRoute({
    _i14.Key? key,
    required _i15.Blog blog,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          CommentRoute.name,
          args: CommentRouteArgs(
            key: key,
            blog: blog,
          ),
          initialChildren: children,
        );

  static const String name = 'CommentRoute';

  static const _i13.PageInfo<CommentRouteArgs> page =
      _i13.PageInfo<CommentRouteArgs>(name);
}

class CommentRouteArgs {
  const CommentRouteArgs({
    this.key,
    required this.blog,
  });

  final _i14.Key? key;

  final _i15.Blog blog;

  @override
  String toString() {
    return 'CommentRouteArgs{key: $key, blog: $blog}';
  }
}

/// generated route for
/// [_i5.HomeNavigationScreen]
class HomeNavigationRoute extends _i13.PageRouteInfo<void> {
  const HomeNavigationRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeNavigationRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MainScreen]
class MainRoute extends _i13.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i14.Key? key,
    required _i16.User user,
    List<_i13.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i13.PageInfo<MainRouteArgs> page =
      _i13.PageInfo<MainRouteArgs>(name);
}

class MainRouteArgs {
  const MainRouteArgs({
    this.key,
    required this.user,
  });

  final _i14.Key? key;

  final _i16.User user;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i8.OnboardingScreen]
class OnboardingRoute extends _i13.PageRouteInfo<void> {
  const OnboardingRoute({List<_i13.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SavedScreen]
class SavedRoute extends _i13.PageRouteInfo<void> {
  const SavedRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SavedRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}

/// generated route for
/// [_i12.YourBlogListScreen]
class YourBlogListRoute extends _i13.PageRouteInfo<void> {
  const YourBlogListRoute({List<_i13.PageRouteInfo>? children})
      : super(
          YourBlogListRoute.name,
          initialChildren: children,
        );

  static const String name = 'YourBlogListRoute';

  static const _i13.PageInfo<void> page = _i13.PageInfo<void>(name);
}
