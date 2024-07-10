import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'flavor.g.dart';

@Riverpod(keepAlive: true)
Flavor flavor(FlavorRef ref) {
  return Flavor.values.byName(appFlavor!);
}

enum Flavor {
  dev(appTitle: 'Haddaf [Dev]'),
  prod(appTitle: 'Haddaf');

  const Flavor({required this.appTitle});

  final String appTitle;
}
