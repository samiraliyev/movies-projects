import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_user_app/features/splash/presentation/pages/splash.dart';

import '../features/genre/presentation/pages/genre_list_page.dart';
// part 'app_router.g.dart';

class AppRouter {
  AppRouter(
      // { required this.analytics,}
      );

  GoRouter get router => _router;
  // final FirebaseAnalytics analytics;
  // final navigatorKey = getIt<NavigationService>().navigatorKey;
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  late final _router = GoRouter(
    initialLocation: AppRoutes.splash,
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      return state.matchedLocation;
    },
    observers: [
      // FirebaseAnalyticsObserver(
      //   analytics: analytics,
      // ),
    ],
    routes: [
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.error,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.splash,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: AppRoutes.genreList,
        builder: (context, state) {
          return const GenreListPage();
        },
      ),
    ],
  );
}
