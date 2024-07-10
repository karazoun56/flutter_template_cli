import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../api_config.dart';

part 'token_interceptor.g.dart';

@Riverpod(keepAlive: true)
TokenInterceptor tokenInterceptor(TokenInterceptorRef ref) {
  return TokenInterceptor(ref);
}

class TokenInterceptor extends QueuedInterceptor {
  TokenInterceptor(this.ref);

  final Ref ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final withoutToken = options.extra[ApiConfig.withoutToken] != null;
    if (withoutToken) return handler.next(options);

    // final authToken = ref.read(authTokensStateProvider);

    // if (authToken is Some<AuthTokens>) {
    //   options.headers[ApiConfig.tokenHeaderKey] =
    //       ApiConfig.convertTokenToBearerToken(authToken.value.accessToken);
    // }

    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Check if the user is unauthorized.
    // if (err.response?.statusCode == 401) {
    //   ref.read(authStatusProvider.notifier).unAuthenticateUser();
    // }
    return handler.next(err);
  }
}
