import 'package:fpdart/fpdart.dart';

import '../../feature/auth/domain/user_model.dart';
import '../../feature/auth/domain/value_objects.dart';

enum RouteAuthority {
  unauthenticated,
  guest,
  user;

  static RouteAuthority fromAuthState(Option<User> authState) {
    return authState.match(
      () => RouteAuthority.unauthenticated,
      (user) {
        switch (user.role) {
          case Role.guest:
            return RouteAuthority.guest;
          case Role.user:
            return RouteAuthority.user;
        }
      },
    );
  }
}
