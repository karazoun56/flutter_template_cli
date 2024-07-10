// ignore_for_file: depend_on_referenced_packages, implementation_imports

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/src/async_notifier.dart' as async_notifier;
import 'package:riverpod/src/notifier.dart' as notifier;

import '../../exceptions/app_error_extension.dart';
import '../../model/paginated_page.dart';
import '../../routing/navigation_service.dart';
import '../../view/component/base/custom_toast.dart';
import '../../view/component/base/dialogs.dart';
import 'util.dart';

typedef ErrorCallback = Widget Function(Object error, StackTrace stackTrace);

extension WidgetRefExtension on WidgetRef {
  bool isLoading<T>(ProviderListenable<AsyncValue<T>> provider) {
    return watch(provider.select((AsyncValue<T> s) => s.isLoading));
  }

  /// Listen to a provider while easy handling Loading/Error dialogs.
  ///
  /// You can set handleLoading/handleError to false to turn off auto handling for either of them.
  ///
  /// Use `whenData` If you want to perform something when the newState is data.
  void easyListen<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    bool handleLoading = true,
    bool handleError = true,
    void Function(T data)? whenData,
    String? Function(Object)? whenError,
  }) {
    return listen(
      provider,
      (prevState, newState) {
        switch (prevState) {
          case AsyncValue(isLoading: true):
            if (handleLoading) NavigationService.popLoadingDialog(context);
        }
        switch (newState) {
          case AsyncValue(isLoading: true):
            if (handleLoading) Dialogs.showLoadingDialog(context);
          case AsyncData(:final value):
            whenData?.call(value);
          case AsyncError(:final error) when whenError != null:
            final msg = whenError.call(error);
            if (msg != null) {
              CustomToast.showErrorMessage(context, msg);
            } else if (handleError) {
              CustomToast.showErrorMessage(context, error.errorMessage(context));
            }
          case AsyncError(:final error) when whenError == null:
            if (handleError) {
              CustomToast.showErrorMessage(context, error.errorMessage(context));
            }
        }
      },
    );
  }

  /// Keep listening to a provider until a Future function is complete.
  ///
  /// This method should be called asynchronously, like inside an onPressed.
  /// It shouldn't be used directly inside the build method.
  Future<void> listenWhile<T>(ProviderBase<T> provider, Future<void> Function() cb) async {
    final sub = listenManual(provider, (_, __) {});
    try {
      return await cb();
    } finally {
      sub.close();
    }
  }
}

// ignore: invalid_use_of_internal_member
mixin NotifierUpdate<T> on notifier.NotifierBase<T> {
  void update(T Function(T state) cb) => state = cb(state);
}

extension AutoDisposeRefExtension<T> on AutoDisposeRef<T> {
  /// When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }

  CancelToken cancelToken() {
    // An object from package:dio that allows cancelling pending network requests
    // if they are no-longer needed.
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }

  /// Keep listening to an autoDispose provider until last listener is removed.
  ///
  /// This is primarily used to initialize and preserve the state of the provider
  /// when navigating to a route until that route is popped off.
  ///
  /// see: https://github.com/rrousselGit/riverpod/issues/1329
  void keepAliveUntilNoListeners() {
    keepAlive();
    onCancel(invalidateSelf);
  }

  /// Keep listening to a provider until a Future function is complete.
  // ignore: invalid_use_of_internal_member
  Future<void> listenWhile<NotifierR extends async_notifier.AsyncNotifierBase<R>, R>(
    // ignore: invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
    async_notifier.AsyncNotifierProviderBase<NotifierR, R> provider,
    Future<void> Function(NotifierR notifier) cb,
  ) async {
    final sub = listen(provider, (_, __) {});
    try {
      return await cb(read(provider.notifier));
    } finally {
      sub.close();
    }
  }
}

extension PaginationExt on WidgetRef {
  Widget? buildPaginatedItem<T>({
    required int index,
    required ProviderListenable<AsyncValue<PaginatedItem<T>>> itemProvider,
    required Widget Function(T item) itemWidget,
    required ErrorCallback errorWidget,
    required Widget Function() loadingWidget,
    Widget? separatorWidget,
    Axis scrollDirection = Axis.vertical,
    int totalLimit = 1000,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })? pageBehavior,
  }) {
    if (index >= totalLimit) return null;

    final itemAsync = watch(itemProvider);
    final loadingDisabled = shouldDisableLoading(index, pageBehavior);
    final errorDisabled = shouldDisableError(index, pageBehavior);

    Widget separatedItem(Widget itemWidget) {
      return buildSeparatedItem(itemWidget, separatorWidget, scrollDirection, index);
    }

    return itemAsync.when(
      skipLoadingOnReload: !itemAsync.hasError,
      skipError: itemAsync.error is! PaginationEndException,
      data: (paginatedItem) => separatedItem(itemWidget(paginatedItem.item)),
      loading: () {
        if (loadingDisabled) return null;
        return buildLoadingWidget(pageBehavior, loadingWidget, separatedItem);
      },
      error: (e, st) {
        if (e is PaginationEndException || errorDisabled) return null;
        return buildErrorWidget(pageBehavior, e, st, errorWidget, separatedItem);
      },
    );
  }

  bool shouldDisableLoading<T>(
    int index,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })? pageBehavior,
  ) {
    if (pageBehavior == null || index == 0) return false;

    final noValueOnPrevItem =
        watch(pageBehavior.prevItemProvider.select((asyncValue) => !asyncValue.hasValue));
    return noValueOnPrevItem && pageBehavior.singleLoading;
  }

  bool shouldDisableError<T>(
    int index,
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })? pageBehavior,
  ) {
    if (pageBehavior == null || index == 0) return false;

    final noValueOnPrevItem =
        watch(pageBehavior.prevItemProvider.select((asyncValue) => !asyncValue.hasValue));
    return noValueOnPrevItem && pageBehavior.singleError;
  }

  Widget buildSeparatedItem(
    Widget itemWidget,
    Widget? separatorWidget,
    Axis scrollDirection,
    int index,
  ) {
    if (separatorWidget == null) return itemWidget;

    if (scrollDirection == Axis.vertical) {
      return Column(
        children: [if (index != 0) separatorWidget, itemWidget],
      );
    } else {
      return Row(
        children: [if (index != 0) separatorWidget, itemWidget],
      );
    }
  }

  Widget? buildLoadingWidget<T>(
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })? pageBehavior,
    Widget Function() loadingWidget,
    Widget Function(Widget) separatedItem,
  ) {
    return switch (pageBehavior) {
      (
        prevItemProvider: _,
        singleError: _,
        singleErrorWidget: _,
        singleLoading: true,
        singleLoadingWidget: final Widget singleLoadingWidget
      ) =>
        singleLoadingWidget,
      _ => separatedItem(loadingWidget()),
    };
  }

  Widget? buildErrorWidget<T>(
    ({
      ProviderListenable<AsyncValue<PaginatedItem<T>>> prevItemProvider,
      bool singleLoading,
      bool singleError,
      Widget? singleLoadingWidget,
      ErrorCallback? singleErrorWidget,
    })? pageBehavior,
    Object e,
    StackTrace st,
    ErrorCallback errorWidget,
    Widget Function(Widget) separatedItem,
  ) {
    return switch (pageBehavior) {
      (
        prevItemProvider: _,
        singleLoading: _,
        singleLoadingWidget: _,
        singleError: true,
        singleErrorWidget: final ErrorCallback singleErrorWidget
      ) =>
        singleErrorWidget.call(e, st),
      _ => separatedItem(errorWidget(e, st)),
    };
  }
}
