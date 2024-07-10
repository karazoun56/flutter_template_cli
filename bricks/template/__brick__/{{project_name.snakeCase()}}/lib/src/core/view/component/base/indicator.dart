import 'package:flutter/material.dart';

class LoadingAppIndicator extends StatelessWidget {
  const LoadingAppIndicator({
    super.key,
    this.size = 24,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
