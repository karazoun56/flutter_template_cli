import 'package:dio/dio.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../config/env/env_config.dart';
import 'interceptors/content_type_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/language_interceptor.dart';
import 'interceptors/response_interceptor.dart';
import 'interceptors/token_interceptor.dart';

abstract class ApiConfig {
  static const String environmentHostName = Config.environmentHostName;
  // static const String baseUrl = 'https://$environmentHostName/api/v1/';
  static const String baseUrl = 'http://157.230.121.38/api/v1';

  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  static String convertTokenToBearerToken(String token) => 'Bearer $token';

  static const contentTypeHeaderKey = 'content-type';
  static const acceptTypeHeaderKey = 'Accept';
  static const applicationJsonContentType = 'application/json';

  static const withoutToken = 'withoutToken';

  static const tokenHeaderKey = 'Authorization';

  static const languageHeaderKey = 'x-lang';

  static final baseOptions = BaseOptions(
    baseUrl: ApiConfig.baseUrl,
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
  );

  /// Returns: A list of main interceptors.
  static IList<Interceptor> interceptorsCollection(Ref ref) => IList(
        [
          ContentTypeInterceptor(),
          ref.read(languageInterceptorProvider),
          ref.read(tokenInterceptorProvider),
          ErrorInterceptor(),
          ResponseInterceptor(),
        ],
      );
}
