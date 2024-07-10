import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/exceptions/future_extensions.dart';

part 'app_warm_up_providers.g.dart';

@riverpod
Future<void> appWarmUp(AppWarmUpRef ref) async {
  // Min Time of splash

  final c1 = Future<void>.delayed(const Duration(seconds: 1, milliseconds: 800));

  // all asynchronous app initialization code should belong here:
  await Future.wait([c1]).throwAllErrors();
}
