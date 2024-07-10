import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../view/component/base/indicator.dart';
import '../../view/component/retry_component.dart';
import '../app_logger/app_logger.dart';

extension AsyncValueExtension<T> on AsyncValue<T> {
  ScreenRetry _handleError(
    String description,
    Object error,
    void Function()? onRetry,
    StackTrace? stackTrace,
  ) {
    printer.f('From AsyncError', error: error, stackTrace: stackTrace);
    return ScreenRetry(onRetry: onRetry, description: description);
  }

  Widget _showLoading() => const Center(child: LoadingAppIndicator());

  Widget appWhen({
    required Widget Function(T data) data,
    required Widget Function(Object error, StackTrace stackTrace) error,
    required Widget Function() loading,
    bool skipError = false,
  }) {
    return when(
      skipLoadingOnRefresh: !hasError,
      skipError: skipError,
      data: data,
      error: error,
      loading: loading,
    );
  }

  Widget whenSuccess({
    required Widget Function(T data) data,
    required void Function() onRetry,
    String? onErrorMessage,
    Widget Function(Object error, StackTrace stackTrace)? error,
    Widget Function()? loading,
    bool skipError = false,
  }) {
    assert(
      onErrorMessage != null || error != null,
      'Either onErrorMessage or error must be provided',
    );
    return appWhen(
      skipError: skipError,
      data: data,
      error: error ??
          (error, stackTrace) => _handleError(
                onErrorMessage ?? '',
                error,
                onRetry,
                stackTrace,
              ),
      loading: loading ?? _showLoading,
    );
  }

  Widget whenSuccessInSliver({
    required Widget Function(T data) data,
    required void Function() onRetry,
    Widget Function(Object error, StackTrace stackTrace)? error,
    Widget Function()? loading,
    bool skipError = false,
    String? onErrorMessage,
  }) {
    assert(
      onErrorMessage != null || error != null,
      'Either onErrorMessage or error must be provided',
    );
    return appWhen(
      skipError: skipError,
      data: data,
      error: error ??
          (error, stackTrace) => SliverFillRemaining(
                hasScrollBody: false,
                child: _handleError(
                  onErrorMessage ?? '',
                  error,
                  onRetry,
                  stackTrace,
                ),
              ),
      loading:
          loading ?? () => const SliverFillRemaining(child: Center(child: LoadingAppIndicator())),
    );
  }

  Widget whenSuccessSliverState({
    required Widget Function(T data) data,
    required void Function() onRetry,
    Widget Function()? loading,
    Widget Function(Object error, StackTrace stackTrace)? error,
    bool skipError = false,
    String? onErrorMessage,
  }) {
    assert(
      onErrorMessage != null || error != null,
      'Either onErrorMessage or error must be provided',
    );
    return appWhen(
      skipError: skipError,
      data: data,
      error: error ??
          (error, stackTrace) => CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: _handleError(
                      onErrorMessage ?? '',
                      error,
                      onRetry,
                      stackTrace,
                    ),
                  ),
                ],
              ),
      loading: loading ??
          () => const CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: LoadingAppIndicator(),
                    ),
                  ),
                ],
              ),
    );
  }
}
