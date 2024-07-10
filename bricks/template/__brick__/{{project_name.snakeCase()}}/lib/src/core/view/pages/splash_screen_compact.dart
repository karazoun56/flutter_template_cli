// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// import '../../config/theme/app_color/extensions_color.dart';
// import '../../gen/app_assets.dart';
// import '../component/base/image.dart';
// import '../component/base/safe_scaffold.dart';

// class SplashScreenCompact extends StatelessWidget {
//   const SplashScreenCompact({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeScaffold(
//       extendBodyBehindAppBar: true,
//       safeTop: false,
//       safeBottom: false,
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: appSwitcherColors(context).neutralColors.shade600,
//             ),
//           ),
//           const AppAssetsImage(AppAssets.ASSETS_IMAGES_SPLASH_BG_PNG),
//           Lottie.asset(AppAssets.ASSETS_NATIVE_SPLASH_LOGO_JSON, repeat: false),
//         ],
//       ),
//     );
//   }
// }
