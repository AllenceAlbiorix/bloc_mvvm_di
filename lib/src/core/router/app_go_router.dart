import 'package:auto_route/auto_route.dart';
import 'package:ny_times_app/src/core/router/app_go_router.gr.dart';
import 'package:ny_times_app/src/core/router/app_route_enum.dart';

/*class AppGoRouter {
  static String currentRoute = AppRouteEnum.intro.path;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final goRouter = GoRouter(
    initialLocation: currentRoute,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: AppRouteEnum.intro.path,
        name: AppRouteEnum.intro.name,
        builder: (context, state) => const IntroPage(),
      ),
      GoRoute(
        path: AppRouteEnum.articlesPage.path,
        name: AppRouteEnum.articlesPage.name,
        builder: (context, state) => const ArticlesPage(),
      ),
      GoRoute(
        path: AppRouteEnum.articleDetailsPage.path,
        name: AppRouteEnum.articleDetailsPage.name,
        routes: [
          GoRoute(
            path: AppRouteEnum.weViewPage.path,
            name: AppRouteEnum.weViewPage.name,
            builder: (context, state) {
              assert(state.extra != null, "Url is required");
              return WebViewPage(
                link: state.extra as String,
              );
            },
          ),
        ],
        builder: (context, state) {
          assert(state.extra != null, "nyTimesArticleModel is required");
          return ArticleDetailsPage(
            model: state.extra as ArticleModel,
          );
        },
      ),
      GoRoute(
        path: AppRouteEnum.photoViewPage.path,
        name: AppRouteEnum.photoViewPage.name,
        builder: (context, state) {
          Map<String, dynamic>? args = state.extra as Map<String, dynamic>?;
          assert(args != null, "You should pass 'path' and 'fromNet'");
          return PhotoViewPage(
            path: args!['path'],
            fromNet: args['fromNet'],
          );
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('No route defined for ${state.path}'),
      ),
    ),
  );
}*/

const ArticlesTab = EmptyShellRoute('ArticlesTab');

@AutoRouterConfig()
class AppAutoRouter extends RootStackRouter {



  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppRouteEnum.intro.path,
          page: IntroPageRoute.page,
          initial: true,
        ),
        AutoRoute(
            path: AppRouteEnum.dashboard.path,
            page: DashboardRoute.page,
            children: [
              AutoRoute(
                  path: AppRouteEnum.articlesPage.path,
                  page: ArticlesTab.page,
                  initial: true,
                  children: [
                    AutoRoute(path: '', page: ArticlesRoute.page),
                    AutoRoute(
                        path: AppRouteEnum.articleDetailsPage.path,
                        page: ArticleDetailsRoute.page),
                    AutoRoute(
                      path: AppRouteEnum.photoViewPage.path,
                      page: PhotoViewRoute.page,
                    ),
                    AutoRoute(
                      path: AppRouteEnum.weViewPage.path,
                      page: WebViewRoute.page,
                    ),
                  ]),
              AutoRoute(
                path: 'settings',
                page: SettingsRoute.page,
              ),
            ]),
      ];
}
