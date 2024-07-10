import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_interceptor.g.dart';

@Riverpod(keepAlive: true)
LanguageInterceptor languageInterceptor(LanguageInterceptorRef ref) {
  return LanguageInterceptor(ref);
}

// Why use QueuedInterceptor instead of Interceptor?
// https://github.com/cfug/dio/issues/1308

@immutable
class LanguageInterceptor extends QueuedInterceptor {
  LanguageInterceptor(this.ref);

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final currentLanguage = ref.read(currentAppLocaleProvider);
    // options.headers[ApiConfig.languageHeaderKey] = currentLanguage.code;

    return handler.next(options);
  }
}
