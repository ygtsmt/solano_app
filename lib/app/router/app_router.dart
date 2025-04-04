import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:solano_app/app/constants/root_path_constants.dart';
import 'package:solano_app/app/router/custom_route_observer.dart';
import 'package:solano_app/features/browser/browser_screen.dart';
import 'package:solano_app/features/explore_solano/explore_solano_screen.dart';
import 'package:solano_app/features/home/home_screen.dart';
import 'package:solano_app/features/splash/view/splash_screen.dart';
import 'package:solano_app/locator_container.dart/locator_container.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter _goRouter = GoRouter(
    observers: [CustomRouteObserver()],
    initialLocation: RootPathConstants.splashRoot,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: RootPathConstants.splashRoot,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (_) => Locator.splashCubit,
              child: SplashScreen(),
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: RootPathConstants.homeRoot,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: RootPathConstants.exploreSolanoRoot,
        builder: (context, state) => ExploreSolanoScreen(),
      ),
      GoRoute(
          path: RootPathConstants.browserRoot,
          builder: (context, state) {
            final item = state.extra! as Map<String, dynamic>;
            return BrowserScreen(
              open: item['open'],
              openUrl: item['openUrl'],
              isExplorer: item['isExplorer'],
            );
          }),
    ],
  );

  static GoRouter get router => _goRouter;
}
