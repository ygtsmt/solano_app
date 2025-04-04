import 'package:flutter/material.dart';
import 'package:solano_app/core/utils/logger/logger_utils.dart';

/// Custom route observer for GoRouter that logs all route changes
class CustomRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    LoggerUtils.instance.logInfo(
      '[GoRouter] New route pushed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    LoggerUtils.instance.logInfo(
      '[GoRouter] Route popped: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    LoggerUtils.instance.logInfo(
      '[GoRouter] Route replaced: ${newRoute?.settings.name}, Old route: ${oldRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    LoggerUtils.instance.logInfo(
      '[GoRouter] Route removed: ${route.settings.name}, Previous route: ${previousRoute?.settings.name}',
    );
  }
}
