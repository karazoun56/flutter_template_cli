import 'package:flutter/material.dart';

import '../../config/theme/app_color/extensions_color.dart';
import '../../utils/const/sizes.dart';

class BottomSheetScaffold extends StatelessWidget {
  const BottomSheetScaffold({
    required this.topBar,
    required this.body,
    super.key,
    this.bottomBar,
    this.showDragHandle = false,
    this.backgroundColor,
    this.constraints,
  });

  final Widget topBar;
  final Widget body;
  final Widget? bottomBar;
  final bool showDragHandle;
  final Color? backgroundColor;
  final BoxConstraints? constraints;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          constraints ?? BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height / 1.2),
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      decoration: BoxDecoration(
        color: backgroundColor ?? appSwitcherColors(context).neutralColors.shade50,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(Sizes.radius20)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showDragHandle) const _DragHandle(),
            topBar,
            Flexible(child: body),
            if (bottomBar != null) bottomBar!,
          ],
        ),
      ),
    );
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        height: 4,
        width: 48,
        color: appSwitcherColors(context).neutralColors.shade600,
      ),
    );
  }
}
