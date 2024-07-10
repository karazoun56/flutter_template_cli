import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/config/env/flavor.dart';
import '../../../core/routing/app_route.dart';
import '../../../core/routing/navigation_service.dart';
import '../../../core/view/component/base/custom_toast.dart';

class HaddafApp extends HookConsumerWidget {
  const HaddafApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(flavorProvider).appTitle;
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: appTitle,
      routerConfig: router,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
      color: Theme.of(context).colorScheme.primary,
      builder: (_, child) {
        return GestureDetector(
          onTap: NavigationService.removeFocus,
          child: FToastOverlay(child: child!),
        );
      },
    );
  }
}
