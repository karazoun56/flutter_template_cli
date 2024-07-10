// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../../../feature/app/presentations/providers/app_warm_up_providers.dart';
// import '../../../feature/auth/presentation/providers/auth_status_provider.dart';
// import '../../routing/app_route.dart';
// import '../component/responsive_widgets/responsive_layouts.dart';
// import 'splash_screen_compact.dart';

// class SplashScreen extends ConsumerWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ref.listen(
//       appWarmUpProvider,
//       (previous, next) async {
//         switch (next) {
//           case AsyncValue(isLoading: false):
//             final notUser = ref.read(authStatusProvider);
//             if (notUser.isNone()) {
//               ref.read(authStatusProvider.notifier).authenticateGuest();
//             }
//             if (context.mounted) const HomeRoute().go(context);
//         }
//       },
//     );
//     return WindowClassLayout(
//       compact: (_) => OrientationLayout(
//         portrait: (_) => const SplashScreenCompact(),
//       ),
//     );
//   }
// }
