import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exceptions/app_error_extension.dart';
import '../../../utils/app_logger/app_logger.dart';
import '../api_config.dart';
import '../interceptors/_api_interceptors.dart';
import '../interceptors/dio_logger_interceptor.dart';

part 'dio_provider.dart';
part 'network_service.g.dart';

@Riverpod(keepAlive: true)
NetworkService networkService(NetworkServiceRef ref) {
  final dio = ref.watch(_dioProvider);
  return NetworkService(dio: dio);
}

class NetworkService {
  NetworkService({required this.dio});
  final Dio dio;

  /// Send GET request to the server
  ///
  /// [path] - The server endpoint to send the request to
  /// [queryParameters] - Query parameters to be added to the request
  /// [options] - Request specific configuration
  /// [cancelToken] - Cancel token to cancel the request
  ///
  /// Returns a [Response] with the server response
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.get<T>(
          path,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  /// Send POST request to the server
  ///
  /// [path] - The server endpoint to send the request to
  /// [queryParameters] - Query parameters to be added to the request
  /// [data] - Request body to be sent to the server
  /// [options] - Request specific configuration
  /// [cancelToken] - Cancel token to cancel the request
  ///
  /// Returns a [Response] with the server response
  Future<Response<T>> post<T>({
    required String path,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.post<T>(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  /// Send PATCH request to the server
  ///
  /// [path] - The server endpoint to send the request to
  /// [data] - Request body to be sent to the server
  /// [options] - Request specific configuration
  /// [cancelToken] - Cancel token to cancel the request
  ///
  /// Returns a [Response] with the server response
  Future<Response<T>> patch<T>({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.patch<T>(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  /// Send PUT request to the server
  ///
  /// [path] - The server endpoint to send the request to
  /// [queryParameters] - Query parameters to be added to the request
  /// [data] - Request body to be sent to the server
  /// [options] - Request specific configuration
  /// [cancelToken] - Cancel token to cancel the request
  ///
  /// Returns a [Response] with the server response
  Future<Response<T>> put<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.put<T>(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  /// Send DELETE request to the server
  ///
  /// [path] - The server endpoint to send the request to
  /// [data] - Request body to be sent to the server
  /// [options] - Request specific configuration
  /// [cancelToken] - Cancel token to cancel the request
  ///
  /// Returns a [Response] with the server response
  Future<Response<T>> delete<T>({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.delete<T>(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<T> _errorHandler<T>(Future<T> Function() body) async {
    try {
      return await body();
    } catch (e, st) {
      final er = e.mainApiErrorToServerException();
      throw Error.throwWithStackTrace(er, st);
    }
  }
}
