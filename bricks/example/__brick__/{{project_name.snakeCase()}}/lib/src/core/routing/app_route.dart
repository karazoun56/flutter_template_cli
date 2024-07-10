import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../feature/auth/domain/user_model.dart';
import '../../feature/auth/domain/value_objects.dart';
import '../../feature/auth/presentation/screens/login_screen.dart';

import '../view/pages/route_error_screen.dart';
import 'route_authority.dart';
import 'util/navigation_transitions.dart';

part 'app_route.g.dart';
part 'guard_route.dart';
part 'routes/auth_routs.dart';
part 'routes/core_routes.dart';
part 'routes/home_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final listenToRefresh = ValueNotifier<bool?>(null);

  final authGuard = AuthGuard(
    ref,
    errorPage: (_, state) => RouteErrorScreen(
      error: state.error,
      onWillPopCallback: (context) => const LoginRoute().location,
      goHomeCallback: (context) => const LoginRoute().location,
    ),
  );
  Uri? currentLocation;

  final appRouter = GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: _rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    refreshListenable: listenToRefresh,
    errorBuilder: authGuard.errorPage,
    redirect: (context, state) {
      final redirectUrl = authGuard.getRedirectUrl(
        state,
        const None(),
        currentLocation.toString(),
      );
      return redirectUrl;
    },
  );

  void onLocationChange() {
    currentLocation = getCurrentLocation(appRouter);
  }

  appRouter.routerDelegate.addListener(onLocationChange);

  ref.onDispose(() {
    listenToRefresh.dispose();
    appRouter.dispose();
  });

  return appRouter;
}

Uri? getCurrentLocation(GoRouter router) {
  if (router.routerDelegate.currentConfiguration.isEmpty) return null;
  final lastMatch = router.routerDelegate.currentConfiguration.last;
  final matchList = lastMatch is ImperativeRouteMatch
      ? lastMatch.matches
      : router.routerDelegate.currentConfiguration;
  return matchList.uri;
}
