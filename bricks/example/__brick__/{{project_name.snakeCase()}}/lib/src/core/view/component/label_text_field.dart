import 'package:flutter/material.dart';

import '../../config/theme/styles/styles.dart';
import '../../utils/const/sizes.dart';

class LabelTextField extends StatelessWidget {
  const LabelTextField({required this.child, required this.label, super.key, this.style});
  final Widget child;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: style ?? TextStyles.f14(context).medium.neutral60(context)),
        const SizedBox(height: Sizes.paddingV8),
        child,
      ],
    );
  }
}
