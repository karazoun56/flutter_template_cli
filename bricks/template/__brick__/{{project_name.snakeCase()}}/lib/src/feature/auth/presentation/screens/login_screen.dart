import 'package:flutter/material.dart';

import '../../../../core/view/component/responsive_widgets/responsive_layouts.dart';
import 'login_screen_compact.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => const LoginScreenCompact(),
      ),
    );
  }
}
