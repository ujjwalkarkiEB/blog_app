import 'package:auto_route/auto_route.dart';

import 'app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(
          path: '/',
          page: MainRoute.page,
          children: [
            AutoRoute(
                page: HomeNavigationRoute.page,
                maintainState: false,
                children: [
                  AutoRoute(
                    initial: true,
                    page: HomeRoute.page,
                  ),
                  AutoRoute(page: BlogCreateRoute.page),
                ]),
            AutoRoute(page: SavedRoute.page),
            AutoRoute(page: YourBlogListRoute.page),
          ],
        ),
        AutoRoute(page: BlogDetailRoute.page),
        AutoRoute(page: CommentRoute.page),
      ];
}
