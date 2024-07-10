part of 'app_route.dart';

final publicRoutes = [
  const SplashRoute().location,
];
final guestRoutes = [];
final unauthenticatedRoutes = [const LoginRoute().location];
final authRoutes = [];

class AuthGuard {
  AuthGuard(this.ref, {required this.errorPage});

  final Ref ref;

  final Widget Function(BuildContext context, GoRouterState state) errorPage;

  List<RouteAuthority> routeAuthority(String routeLocation) {
    const defaultAuthority = [RouteAuthority.user];

    if (publicRoutes.any(routeLocation.startsWith)) {
      return RouteAuthority.values;
    }
    if (unauthenticatedRoutes.any(routeLocation.startsWith)) {
      return const [RouteAuthority.unauthenticated];
    }

    if (guestRoutes.any((route) => route == routeLocation)) {
      return const [...defaultAuthority, RouteAuthority.guest];
    }

    throw UnimplementedError('Route $routeLocation has not set routeAuthority.');
  }

  bool canAccess(GoRouterState state, Option<User> authState) {
    return routeAuthority(state.uri.toString()).contains(RouteAuthority.fromAuthState(authState));
  }

  String? getRedirectUrl(GoRouterState state, Option<User> authState, String currentLocation) {
    if (!canAccess(state, authState)) {
      switch (authState) {
        case Some() when authState.value.role == Role.guest:
          switch (state.uri.toString()) {
            case final loc when loc.endsWith(const LoginRoute().location):
              return const LoginRoute().location;
            case final loc when loc.startsWith(const LoginRoute().location):
              return const LoginRoute().location;
            // Stay at the same location when the guest tries to access other non-legit routes.
            // (A dialog will appear to him using ref.listen which asks him to login)
            default:
              return currentLocation;
          }
        case Some():
          return const LoginRoute().location;
        case None():
          return const LoginRoute().location;
      }
    }
    return null;
  }
}
